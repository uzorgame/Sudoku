import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku2/flutter_gen/gen_l10n/app_localizations.dart';

import '../controllers/achievement_controller.dart';
import '../layout/layout_scale.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: _AchievementsBody(),
      ),
    );
  }
}

class _AchievementsBody extends StatelessWidget {
  const _AchievementsBody();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scale = context.layoutScale;
    final sectionStyle = theme.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
      color: theme.colorScheme.onSurface,
    );
    return Consumer<AchievementController>(
      builder: (context, controller, _) {
        if (!controller.isLoaded) {
          return const Center(child: CircularProgressIndicator());
        }
        final achievements = controller.achievementsProgress;
        return Padding(
          padding: EdgeInsets.fromLTRB(
            24 * scale,
            24 * scale,
            24 * scale,
            24 * scale,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.ach_section_title, style: sectionStyle),
              SizedBox(height: 16 * scale),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(28 * scale),
                    boxShadow: [
                      BoxShadow(
                        color: theme.shadowColor,
                        blurRadius: 24 * scale,
                        offset: Offset(0, 8 * scale),
                        spreadRadius: -6 * scale,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24 * scale),
                  child: ListView.separated(
                    itemCount: achievements.length,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (_, __) => SizedBox(height: 16 * scale),
                    itemBuilder: (context, index) {
                      final data = achievements[index];
                      return _AchievementListItem(
                        data: data,
                        l10n: l10n,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AchievementListItem extends StatelessWidget {
  const _AchievementListItem({
    required this.data,
    required this.l10n,
  });

  final AchievementProgressData data;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scale = context.layoutScale;
    final isUnlocked = data.achievement.unlocked;
    final titleStyle = theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.onSurface,
        ) ??
        TextStyle(
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.onSurface,
        );
    final descriptionStyle = theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.7),
        ) ??
        TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7));
    final metaStyle = theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ) ??
        TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));
    final percentStyle = theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ) ??
        TextStyle(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        );

    return Stack(
      children: [
        Material(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _AchievementIcon(
                    imagePath: data.achievement.imagePath,
                    dimmed: !isUnlocked,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _titleFor(l10n, data.achievement.id),
                                    style: titleStyle,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _descriptionFor(l10n, data.achievement.id),
                                    style: descriptionStyle,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              l10n.ach_percent(data.percent),
                              style: percentStyle,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _AchievementProgressBar(
                          progress: data.progress,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(height: 8),
                        if (isUnlocked)
                          Text(
                            l10n.ach_status_finished,
                            style: metaStyle,
                          )
                        else
                          Text(
                            l10n.ach_status_in_progress(data.current),
                            style: metaStyle,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AchievementIcon extends StatelessWidget {
  const _AchievementIcon({
    required this.imagePath,
    required this.dimmed,
  });

  final String imagePath;
  final bool dimmed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final image = ClipOval(
      child: Image.asset(
        imagePath,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.emoji_events,
          size: 28,
          color: theme.colorScheme.primary,
        ),
      ),
    );
    final badge = Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.12),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: image,
    );
    return dimmed
        ? Opacity(opacity: 0.4, child: badge)
        : badge;
  }
}

class _AchievementProgressBar extends StatelessWidget {
  const _AchievementProgressBar({
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final background = theme.colorScheme.surfaceVariant.withOpacity(
      theme.brightness == Brightness.dark ? 0.6 : 1,
    );
    return Container(
      height: 6,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: progress.clamp(0.0, 1.0),
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}

String _titleFor(AppLocalizations l10n, String id) {
  switch (id) {
    case 'wins_50':
      return l10n.ach_title_wins_50;
    case 'no_mistakes':
      return l10n.ach_title_no_mistakes;
    case 'streak_3days':
      return l10n.ach_title_streak_3days;
    case 'fast_solver':
      return l10n.ach_title_fast_solver;
    case 'supermind':
      return l10n.ach_title_supermind;
    case 'wins_100':
      return l10n.ach_title_wins_100;
    default:
      return id;
  }
}

String _descriptionFor(AppLocalizations l10n, String id) {
  switch (id) {
    case 'wins_50':
      return l10n.ach_desc_wins_50;
    case 'no_mistakes':
      return l10n.ach_desc_no_mistakes;
    case 'streak_3days':
      return l10n.ach_desc_streak_3days;
    case 'fast_solver':
      return l10n.ach_desc_fast_solver;
    case 'supermind':
      return l10n.ach_desc_supermind;
    case 'wins_100':
      return l10n.ach_desc_wins_100;
    default:
      return '';
  }
}
