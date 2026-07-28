import json
import re
import time
from collections import OrderedDict
from pathlib import Path
from typing import Dict, List, Tuple

import requests

ROOT = Path(__file__).resolve().parents[1]
ARB_DIR = ROOT / 'lib' / 'l10n'

LANGS = OrderedDict([
    ('id', 'id'),
    ('vi', 'vi'),
    ('th', 'th'),
    ('nl', 'nl'),
    ('sv', 'sv'),
    ('ro', 'ro'),
    ('cs', 'cs'),
    ('fi', 'fi'),
    ('kk', 'kk'),
])

MANUAL_OVERRIDES = {
    'id': {
        'difficultyNovice': 'Pemula',
        'difficultyNoviceShort': 'Pem.',
        'difficultyMedium': 'Menengah',
        'difficultyMediumShort': 'Men.',
        'difficultyHigh': 'Sulit',
        'difficultyHighShort': 'Sul.',
        'difficultyExpert': 'Ahli',
        'difficultyExpertShort': 'Ahl.',
        'difficultyMaster': 'Mahir',
        'difficultyMasterShort': 'Mah.',
    },
    'vi': {
        'difficultyNovice': 'Người mới',
        'difficultyNoviceShort': 'Mới',
        'difficultyMedium': 'Trung bình',
        'difficultyMediumShort': 'TB',
        'difficultyHigh': 'Khó',
        'difficultyHighShort': 'Khó',
        'difficultyExpert': 'Chuyên gia',
        'difficultyExpertShort': 'CG',
        'difficultyMaster': 'Bậc thầy',
        'difficultyMasterShort': 'BT',
    },
    'th': {
        'difficultyNovice': 'มือใหม่',
        'difficultyNoviceShort': 'ใหม่',
        'difficultyMedium': 'ปานกลาง',
        'difficultyMediumShort': 'กลาง',
        'difficultyHigh': 'ยาก',
        'difficultyHighShort': 'ยาก',
        'difficultyExpert': 'ผู้เชี่ยวชาญ',
        'difficultyExpertShort': 'เชี่ยว',
        'difficultyMaster': 'ปรมาจารย์',
        'difficultyMasterShort': 'ปรม.',
    },
    'nl': {
        'difficultyNovice': 'Beginner',
        'difficultyNoviceShort': 'Beg.',
        'difficultyMedium': 'Gemiddeld',
        'difficultyMediumShort': 'Gem.',
        'difficultyHigh': 'Moeilijk',
        'difficultyHighShort': 'Moe.',
        'difficultyExpert': 'Expert',
        'difficultyExpertShort': 'Exp.',
        'difficultyMaster': 'Meester',
        'difficultyMasterShort': 'Mst.',
    },
    'sv': {
        'difficultyNovice': 'Nybörjare',
        'difficultyNoviceShort': 'Nyb.',
        'difficultyMedium': 'Medel',
        'difficultyMediumShort': 'Med.',
        'difficultyHigh': 'Svår',
        'difficultyHighShort': 'Svår',
        'difficultyExpert': 'Expert',
        'difficultyExpertShort': 'Exp.',
        'difficultyMaster': 'Mästare',
        'difficultyMasterShort': 'Mäs.',
    },
    'ro': {
        'difficultyNovice': 'Începător',
        'difficultyNoviceShort': 'Înc.',
        'difficultyMedium': 'Mediu',
        'difficultyMediumShort': 'Med.',
        'difficultyHigh': 'Greu',
        'difficultyHighShort': 'Greu',
        'difficultyExpert': 'Expert',
        'difficultyExpertShort': 'Exp.',
        'difficultyMaster': 'Maestru',
        'difficultyMasterShort': 'Mae.',
    },
    'cs': {
        'difficultyNovice': 'Začátečník',
        'difficultyNoviceShort': 'Zač.',
        'difficultyMedium': 'Střední',
        'difficultyMediumShort': 'Stř.',
        'difficultyHigh': 'Obtížné',
        'difficultyHighShort': 'Obt.',
        'difficultyExpert': 'Expert',
        'difficultyExpertShort': 'Exp.',
        'difficultyMaster': 'Mistr',
        'difficultyMasterShort': 'Mistr',
    },
    'fi': {
        'difficultyNovice': 'Aloittelija',
        'difficultyNoviceShort': 'Alo.',
        'difficultyMedium': 'Keskitaso',
        'difficultyMediumShort': 'Kes.',
        'difficultyHigh': 'Vaikea',
        'difficultyHighShort': 'Vai.',
        'difficultyExpert': 'Ekspertti',
        'difficultyExpertShort': 'Eks.',
        'difficultyMaster': 'Mestari',
        'difficultyMasterShort': 'Mes.',
    },
    'kk': {
        'difficultyNovice': 'Жаңадан бастаушы',
        'difficultyNoviceShort': 'Жаң.',
        'difficultyMedium': 'Орташа',
        'difficultyMediumShort': 'Орта.',
        'difficultyHigh': 'Қиын',
        'difficultyHighShort': 'Қиын',
        'difficultyExpert': 'Сарапшы',
        'difficultyExpertShort': 'Сар.',
        'difficultyMaster': 'Шебер',
        'difficultyMasterShort': 'Шеб.',
    },
}

PLACEHOLDER_PATTERN = re.compile(r"\{[^{}]+\}")
PLURAL_PATTERN = re.compile(
    r"^(?P<prefix>\+?)\{(?P<var>\w+), plural, one \{# (?P<one>[^{}]+)\} other \{# (?P<other>[^{}]+)\}\}$"
)

_translation_cache: Dict[Tuple[str, str], str] = {}


def _load_ordered_json(path: Path) -> OrderedDict:
    with path.open('r', encoding='utf-8') as fh:
        return json.load(fh, object_pairs_hook=OrderedDict)


def _write_ordered_json(path: Path, data: OrderedDict) -> None:
    with path.open('w', encoding='utf-8') as fh:
        json.dump(data, fh, ensure_ascii=False, indent=2)
        fh.write('\n')


def _sanitize_text(text: str) -> Tuple[str, List[str]]:
    if not text:
        return text, []

    placeholders: List[str] = []

    def repl(match: re.Match) -> str:
        placeholders.append(match.group(0))
        return f"__PH_{len(placeholders) - 1}__"

    sanitized = PLACEHOLDER_PATTERN.sub(repl, text)
    sanitized = sanitized.replace('\n', '__NL__')
    return sanitized, placeholders


def _restore_text(translated: str, placeholders: List[str]) -> str:
    if not translated:
        return translated

    result = translated
    for idx, original in enumerate(placeholders):
        result = result.replace(f"__PH_{idx}__", original)
    result = result.replace('__NL__', '\n')
    return result


def _build_plural(prefix: str, var: str, one: str, other: str) -> str:
    return (
        prefix
        + "{"
        + var
        + ", plural, one {# "
        + one
        + "} other {# "
        + other
        + "}}"
    )


def _translate_in_chunks(texts: List[str], dest: str) -> List[str]:
    results: List[str] = []
    chunk_size = 20
    for index in range(0, len(texts), chunk_size):
        chunk = texts[index : index + chunk_size]
        chunk_results: List[str] = [""] * len(chunk)
        missing: List[str] = []
        missing_indices: List[int] = []

        for offset, text in enumerate(chunk):
            key = (dest, text)
            if key in _translation_cache:
                chunk_results[offset] = _translation_cache[key]
            else:
                missing.append(text)
                missing_indices.append(offset)

        if missing:
            translations = _request_translation_batch(missing, dest)
            for position, text, translated in zip(missing_indices, missing, translations):
                _translation_cache[(dest, text)] = translated
                chunk_results[position] = translated

        results.extend(chunk_results)

    return results


def _request_translation_batch(texts: List[str], dest: str, max_retries: int = 3) -> List[str]:
    if not texts:
        return []

    payload = "\n".join(texts)
    for attempt in range(max_retries):
        try:
            response = requests.get(
                "https://translate.googleapis.com/translate_a/single",
                params={
                    "client": "gtx",
                    "sl": "en",
                    "tl": dest,
                    "dt": "t",
                    "q": payload,
                },
                timeout=10,
            )
            response.raise_for_status()
            data = response.json()
            segments = data[0]

            translations: List[str] = []
            current = ""
            consumed = 0
            for translated, original, *_ in segments:
                current += translated
                if original.endswith("\n"):
                    translations.append(current.rstrip("\n"))
                    current = ""
                    consumed += 1

            if current or consumed < len(texts):
                translations.append(current)

            if len(translations) != len(texts):
                raise ValueError("Translation count mismatch")

            time.sleep(0.1)
            return translations
        except Exception:
            if attempt == max_retries - 1:
                return list(texts)
            time.sleep(1)

    return list(texts)


def main() -> None:
    base = _load_ordered_json(ARB_DIR / 'app_en.arb')
    keys = list(base.keys())

    for lang, dest in LANGS.items():
        print(f'Translating {lang} -> {dest}')
        data = OrderedDict()
        simple_records = []
        plural_tasks = []

        for key in keys:
            value = base[key]
            if key.startswith('@@') or key.startswith('@'):
                data[key] = value
                continue

            if not isinstance(value, str):
                data[key] = value
                continue

            match = PLURAL_PATTERN.match(value)
            if match:
                sanitized_one, placeholders_one = _sanitize_text(match.group('one'))
                sanitized_other, placeholders_other = _sanitize_text(match.group('other'))
                simple_records.append((key, 'one', sanitized_one, placeholders_one))
                simple_records.append((key, 'other', sanitized_other, placeholders_other))
                plural_tasks.append(
                    (
                        key,
                        match.group('prefix'),
                        match.group('var'),
                    )
                )
            else:
                sanitized, placeholders = _sanitize_text(value)
                simple_records.append((key, 'value', sanitized, placeholders))

        translations = []
        if simple_records:
            texts = [record[2] for record in simple_records]
            translations = _translate_in_chunks(texts, dest)

        translated_values = {}
        for record, translated in zip(simple_records, translations):
            key, part, _, placeholders = record
            restored = _restore_text(translated, placeholders)
            translated_values.setdefault(key, {})[part] = restored

        for key in keys:
            if key.startswith('@@') or key.startswith('@'):
                continue
            if not isinstance(base[key], str):
                continue

            values = translated_values.get(key)
            if not values:
                continue

            if 'value' in values:
                data[key] = values['value']
            else:
                prefix = ''
                var = ''
                for task in plural_tasks:
                    if task[0] == key:
                        prefix, var = task[1], task[2]
                        break
                one_value = values.get('one', '').strip()
                other_value = values.get('other', '').strip()
                data[key] = _build_plural(prefix, var, one_value, other_value)

        overrides = MANUAL_OVERRIDES.get(lang)
        if overrides:
            for override_key, override_value in overrides.items():
                data[override_key] = override_value

        target_path = ARB_DIR / f'app_{lang}.arb'
        data['@@locale'] = lang
        _write_ordered_json(target_path, data)


if __name__ == '__main__':
    main()
