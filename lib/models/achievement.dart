class Achievement {
  final String id;
  final String imagePath;
  final bool unlocked;
  final DateTime? unlockedAt;

  const Achievement({
    required this.id,
    required this.imagePath,
    this.unlocked = false,
    this.unlockedAt,
  });

  Achievement copyWith({
    bool? unlocked,
    Object? unlockedAt = _sentinel,
  }) {
    return Achievement(
      id: id,
      imagePath: imagePath,
      unlocked: unlocked ?? this.unlocked,
      unlockedAt: identical(unlockedAt, _sentinel)
          ? this.unlockedAt
          : unlockedAt as DateTime?,
    );
  }

  Map<String, dynamic> toJson() => {
        'unlocked': unlocked,
        'unlockedAt': unlockedAt?.toIso8601String(),
      };

  static Achievement merge(Achievement base, Map<String, dynamic>? json) {
    if (json == null) {
      return base;
    }
    final unlocked = json['unlocked'] == true;
    final unlockedAtRaw = json['unlockedAt'];
    DateTime? unlockedAt;
    if (unlockedAtRaw is String && unlockedAtRaw.isNotEmpty) {
      unlockedAt = DateTime.tryParse(unlockedAtRaw);
    }
    if (!unlocked) {
      return base;
    }
    return base.copyWith(unlocked: true, unlockedAt: unlockedAt);
  }

  static const Object _sentinel = Object();
}
