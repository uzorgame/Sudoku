import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../flutter_gen/gen_l10n/app_localizations.dart';
import '../layout/layout_scale.dart';
import '../models.dart';
import '../services/rate_app_service.dart';

Future<bool> showRateAppDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (dialogContext) => const RateAppDialog(),
  );
  return result ?? false;
}

class RateAppDialog extends StatelessWidget {
  const RateAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scale = context.layoutScale;
    final textTheme = theme.textTheme;

    final titleStyle = textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w700,
    );
    final subtitleStyle = textTheme.bodyLarge?.copyWith(
      height: 1.4,
      fontWeight: FontWeight.w500,
    );
    const starEmoji = '⭐️';
    const starBaseSize = 36.0;
    const starScaleFactor = 0.83; // 17% smaller than the original size.
    final starFontSize = starBaseSize * starScaleFactor * scale;
    final buttonHeight = 48 * scale;
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16 * scale),
    );

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 24 * scale,
        vertical: 24 * scale,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Padding(
          padding: EdgeInsets.all(24 * scale),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.rateDialogTitle,
                textAlign: TextAlign.center,
                style: titleStyle,
              ),
              SizedBox(height: 16 * scale),
              Text(
                l10n.rateDialogSubtitle,
                textAlign: TextAlign.center,
                style: subtitleStyle,
              ),
              SizedBox(height: 24 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6 * scale),
                    child: Text(
                      starEmoji,
                      style: TextStyle(
                        fontSize: starFontSize,
                        color: Colors.yellow,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 24 * scale),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size.fromHeight(buttonHeight),
                        shape: buttonShape,
                      ),
                      child: Text(l10n.rateDialogDismiss),
                    ),
                  ),
                  SizedBox(width: 12 * scale),
                  Expanded(
                    child: FilledButton(
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        final appState = context.read<AppState>();
                        final didRequestReview =
                            await RateAppService.instance.requestReview();
                        if (navigator.mounted) {
                          navigator.pop(didRequestReview);
                        }
                        if (didRequestReview) {
                          appState.markUserRated();
                        }
                      },
                      style: FilledButton.styleFrom(
                        minimumSize: Size.fromHeight(buttonHeight),
                        shape: buttonShape,
                      ),
                      child: Text(l10n.rateDialogConfirm),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
