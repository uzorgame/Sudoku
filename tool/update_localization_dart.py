import json
import re
from collections import OrderedDict
from pathlib import Path
from typing import Dict, List

ROOT = Path(__file__).resolve().parents[1]
ARB_DIR = ROOT / 'lib' / 'l10n'
DART_DIR = ROOT / 'lib' / 'flutter_gen' / 'gen_l10n'

LANGS = ['id', 'vi', 'th', 'nl', 'sv', 'ro', 'cs', 'fi', 'kk']
PLURAL_KEYS = {'rewardExtraHearts', 'rewardStars'}
CATEGORY_ORDER = ['zero', 'one', 'two', 'few', 'many', 'other']

PLACEHOLDER_RE = re.compile(r'\{(\w+)\}')
PLURAL_PARSE_RE = re.compile(
    r"^(?P<prefix>[^{}]*)\{(?P<var>\w+),\s*plural,(?P<body>.*)\}$",
    re.DOTALL,
)
CATEGORY_RE = re.compile(r"(\w+)\s*\{([^{}]*)\}")


def _load_arb(lang: str) -> OrderedDict:
    path = ARB_DIR / f'app_{lang}.arb'
    with path.open('r', encoding='utf-8') as fh:
        return json.load(fh, object_pairs_hook=OrderedDict)


def _escape_string(value: str) -> str:
    escaped = value.replace('\\', '\\\\')
    escaped = escaped.replace("'", "\\'")
    escaped = escaped.replace('\n', '\\n')
    return escaped


def _convert_placeholders(value: str) -> str:
    return PLACEHOLDER_RE.sub(lambda m: f'${m.group(1)}', value)


def _update_getter(dart: str, key: str, new_value: str) -> str:
    pattern = re.compile(rf"(String get {key} =>\s*)'((?:\\'|[^'])*)';")

    def _replacer(match: re.Match[str]) -> str:
        return match.group(1) + f"'{new_value}';"

    updated, count = pattern.subn(_replacer, dart, count=1)
    if count == 0:
        raise KeyError(f'Getter for {key} not found')
    return updated


def _update_method(dart: str, key: str, new_value: str) -> str:
    marker = f"String {key}"
    start = dart.find(marker)
    if start == -1:
        raise KeyError(f'Method for {key} not found')

    return_index = dart.find("return '", start)
    if return_index == -1:
        raise KeyError(f"Return statement for {key} not found")

    value_start = return_index + len("return '")
    value_end = dart.find("';", value_start)
    if value_end == -1:
        raise KeyError(f"Terminator for {key} not found")

    return dart[:value_start] + new_value + dart[value_end:]


def _parse_plural(value: str) -> Dict[str, str]:
    match = PLURAL_PARSE_RE.match(value.strip())
    if not match:
        raise ValueError(f'Unsupported plural format: {value}')
    prefix = match.group('prefix')
    body = match.group('body')
    categories: Dict[str, str] = {}
    for category, text in CATEGORY_RE.findall(body):
        categories[category] = text.strip()
    return prefix, categories


def _build_plural_method(key: str, prefix: str, categories: Dict[str, str]) -> str:
    lines: List[str] = [
        f"  @override",
        f"  String {key}(num count) {{",
        "    String _temp0 = intl.Intl.pluralLogic(",
        "      count,",
        "      locale: localeName,",
    ]

    for category in CATEGORY_ORDER:
        if category in categories:
            value = categories[category]
            value = _convert_placeholders(value)
            value = _escape_string(value)
            lines.append(f"      {category}: '{value}',")

    lines.append("    );")

    prefix_value = _escape_string(prefix)
    if prefix_value:
        lines.append(f"    return '{prefix_value}$_temp0';")
    else:
        lines.append("    return '$_temp0';")

    lines.append("  }\n")
    return "\n".join(lines)


def _update_plural_method(dart: str, key: str, value: str) -> str:
    prefix, categories = _parse_plural(value)
    method_block = _build_plural_method(key, prefix, categories)
    marker = f"  @override\n  String {key}(num count) {{"
    start = dart.find(marker)
    if start == -1:
        raise KeyError(f'Plural method for {key} not found')

    end = dart.find('\n  }\n', start)
    if end == -1:
        raise KeyError(f'Unable to locate end of plural method for {key}')
    end += len('\n  }\n')

    return dart[:start] + method_block + dart[end:]


def main() -> None:
    for lang in LANGS:
        arb = _load_arb(lang)
        dart_path = DART_DIR / f'app_localizations_{lang}.dart'
        dart_text = dart_path.read_text(encoding='utf-8')

        for key, value in arb.items():
            if key.startswith('@@') or key.startswith('@'):
                continue

            if key in PLURAL_KEYS:
                dart_text = _update_plural_method(dart_text, key, value)
                continue

            converted = _convert_placeholders(value)
            escaped = _escape_string(converted)

            try:
                dart_text = _update_getter(dart_text, key, escaped)
            except KeyError:
                dart_text = _update_method(dart_text, key, escaped)

        dart_path.write_text(dart_text, encoding='utf-8')


if __name__ == '__main__':
    main()
