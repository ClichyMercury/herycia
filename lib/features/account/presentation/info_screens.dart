import 'package:flutter/material.dart';

import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';

class _TextScreen extends StatelessWidget {
  const _TextScreen({required this.title, required this.paragraphs});

  final String title;
  final List<String> paragraphs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
        children: [
          for (final p in paragraphs)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.s4),
              child: Text(p, style: context.typo.body.copyWith(color: context.colors.textPrimary)),
            ),
        ],
      ),
    );
  }
}

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      _TextScreen(title: context.l10n.privacyTitle, paragraphs: [context.l10n.privacyBody]);
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const version = '1.0.0';

  @override
  Widget build(BuildContext context) => _TextScreen(
        title: context.l10n.aboutTitle,
        paragraphs: [context.l10n.aboutVersion(version), context.l10n.aboutBody],
      );
}
