import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku2/flutter_gen/gen_l10n/app_localizations.dart';

import 'models.dart';
import 'layout/layout_scale.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    final scale = context.layoutScale;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.languageSectionTitle),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final spacing = 11.0 * scale;
          final previousCrossAxisCount = () {
            final width = constraints.maxWidth;
            if (width < 520) {
              return 2;
            }
            if (width < 900) {
              return 3;
            }
            return 4;
          }();

          const baseAspectRatio = 2.2;
          // Reduce the banner height by roughly an additional 8% (≈14.5% total)
          // by increasing the child-aspect ratio (height = width / aspectRatio).
          const heightReductionFactor = 0.8556;

          final gridPadding = EdgeInsets.all(16 * scale);
          final availableWidth = math.max(
            0.0,
            constraints.maxWidth - gridPadding.horizontal,
          );

          final childAspectRatio = baseAspectRatio / heightReductionFactor;
          final previousTileWidth = math.max(
                0.0,
                availableWidth - (previousCrossAxisCount - 1) * spacing,
              ) /
              previousCrossAxisCount;
          final previousTileHeight = previousTileWidth > 0
              ? previousTileWidth / childAspectRatio
              : 0.0;
          final adjustedChildAspectRatio = previousTileHeight > 0
              ? availableWidth / previousTileHeight
              : childAspectRatio;
          // Slightly shrink the banners to 95% of their previous height.
          const sizeReductionFactor = 0.95;
          final finalChildAspectRatio =
              adjustedChildAspectRatio / sizeReductionFactor;

          return GridView.builder(
            key: const ValueKey('language-grid'),
            padding: gridPadding,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
              childAspectRatio: finalChildAspectRatio,
            ),
            itemCount: AppLanguage.values.length,
            itemBuilder: (context, index) {
              final lang = AppLanguage.values[index];
              return _LanguageTile(
                language: lang,
                selected: lang == app.lang,
                scale: scale,
                onTap: () => unawaited(app.setLang(lang)),
              );
            },
          );
        },
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.language,
    required this.selected,
    required this.scale,
    required this.onTap,
  });

  final AppLanguage language;
  final bool selected;
  final double scale;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final borderRadius = BorderRadius.circular(12 * scale);
    final backgroundColor = selected
        ? colorScheme.primary.withOpacity(0.12)
        : theme.cardColor;
    final borderColor = selected
        ? colorScheme.primary
        : colorScheme.outline.withOpacity(0.2);
    final List<BoxShadow> boxShadow = selected
        ? [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.25),
              blurRadius: 12 * scale,
              offset: Offset(0, 6 * scale),
            ),
          ]
        : const <BoxShadow>[];

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
            border: Border.all(color: borderColor, width: 1.5),
            boxShadow: boxShadow,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * scale,
              vertical: 13 * scale,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                language.nativeName,
                textAlign: TextAlign.start,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: 16 * scale,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
