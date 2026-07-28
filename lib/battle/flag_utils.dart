String? emojiFlagToCountryCode(String? emojiFlag) {
  final trimmed = emojiFlag?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  final runes = trimmed.runes
      .where((rune) => rune >= 0x1F1E6 && rune <= 0x1F1FF)
      .toList(growable: false);
  if (runes.length != 2) {
    return null;
  }

  final buffer = StringBuffer();
  for (final rune in runes) {
    buffer.writeCharCode(rune - 0x1F1E6 + 0x41);
  }

  final code = buffer.toString();
  if (code.isEmpty) {
    return null;
  }

  return code.toLowerCase();
}
