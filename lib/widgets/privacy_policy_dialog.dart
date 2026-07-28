import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../flutter_gen/gen_l10n/app_localizations.dart';
import '../layout/layout_scale.dart';

const _privacyPolicyUrl = 'https://uzorgame.github.io/privacy-policy.html';

Future<void> openPrivacyPolicyLink(BuildContext context) async {
  final uri = Uri.parse(_privacyPolicyUrl);
  try {
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!launched) {
      _showLaunchError(context);
    }
  } catch (_) {
    _showLaunchError(context);
  }
}

Future<void> showPrivacyPolicyContent(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  final theme = Theme.of(context);
  final scale = context.layoutScale;
  final textTheme = theme.textTheme;
  final sectionTitleStyle =
      textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);
  final bodyStyle = textTheme.bodyMedium?.copyWith(height: 1.5);
  final linkStyle = textTheme.bodyMedium?.copyWith(
    color: Colors.blue,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w600,
  );

  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final maxHeight = MediaQuery.of(dialogContext).size.height * 0.7;

      return AlertDialog(
        title: const Text('Privacy Policy'),
        contentPadding: EdgeInsets.only(
          left: 24 * scale,
          right: 16 * scale,
          top: 16 * scale,
          bottom: 0,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(right: 8 * scale),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Privacy Policy — Sudoku (UzorGame)', style: sectionTitleStyle),
                      SizedBox(height: 12 * scale),
                      Text(
                        'We (UzorGame) do not collect, store, or share personal data.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 8 * scale),
                      Text(
                        'Game progress and settings are saved locally on your device — no accounts, no servers.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 16 * scale),
                      Text('Ads (Google AdMob):', style: sectionTitleStyle),
                      SizedBox(height: 8 * scale),
                      Text(
                        'Google may process your device info, coarse location, ad interactions, and advertising ID to show and measure ads.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 8 * scale),
                      Text(
                        'Ad personalization depends on your consent and Android ad settings. If declined, only non-personalized ads appear.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 16 * scale),
                      Text('Consent (EEA/UK):', style: sectionTitleStyle),
                      SizedBox(height: 8 * scale),
                      Text(
                        'We use Google’s User Messaging Platform (UMP) to ask for ad consent.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 8 * scale),
                      Text(
                        'You can change your choice anytime in: Settings → Privacy.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 16 * scale),
                      Text('Children:', style: sectionTitleStyle),
                      SizedBox(height: 8 * scale),
                      Text(
                        'Game is for a general audience; we don’t knowingly collect data from children.',
                        style: bodyStyle,
                      ),
                      SizedBox(height: 16 * scale),
                      InkWell(
                        onTap: () => openPrivacyPolicyLink(dialogContext),
                        borderRadius: BorderRadius.circular(8 * scale),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4 * scale),
                          child: Text(
                            '👉 Read full policy online',
                            style: linkStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.privacyPolicyClose),
          ),
        ],
      );
    },
  );
}

Future<bool> showPrivacyPolicyDialog(
  BuildContext context, {
  required bool requireAcceptance,
}) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: !requireAcceptance,
    builder: (dialogContext) {
      return _PrivacyPolicyDialog(requireAcceptance: requireAcceptance);
    },
  );
  return result ?? false;
}

void _showLaunchError(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  final message = l10n?.failed ?? 'Failed';
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

class _PrivacyPolicyDialog extends StatelessWidget {
  final bool requireAcceptance;

  const _PrivacyPolicyDialog({required this.requireAcceptance});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final scale = context.layoutScale;
    final textTheme = theme.textTheme;

    final titleStyle = textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w700,
    );
    final promptStyle = textTheme.bodyLarge?.copyWith(
      height: 1.4,
      fontWeight: FontWeight.w500,
    );
    final linkStyle = textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.primary,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w600,
    );

    return WillPopScope(
      onWillPop: () async => !requireAcceptance,
      child: Dialog(
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
                  l10n.privacyPolicyTitle,
                  textAlign: TextAlign.center,
                  style: titleStyle,
                ),
                SizedBox(height: 24 * scale),
                Text(
                  l10n.privacyPolicyPrompt,
                  textAlign: TextAlign.center,
                  style: promptStyle,
                ),
                SizedBox(height: 16 * scale),
                Center(
                  child: InkWell(
                    onTap: () => openPrivacyPolicyLink(context),
                    borderRadius: BorderRadius.circular(12 * scale),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12 * scale,
                        vertical: 8 * scale,
                      ),
                      child: Text(
                        l10n.privacyPolicyLearnMore,
                        style: linkStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24 * scale),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(l10n.privacyPolicyDecline),
                      ),
                    ),
                    SizedBox(width: 12 * scale),
                    Expanded(
                      child: FilledButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text(l10n.privacyPolicyAccept),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
