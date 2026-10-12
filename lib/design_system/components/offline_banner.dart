import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/app_icons.dart';
import '../tokens/layout.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        color: colors.infoBg,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenHorizontal,
          vertical: AppSpacing.s2,
        ),
        child: Row(
          children: [
            Icon(AppIcons.offline, size: 16, color: colors.textPrimary),
            const SizedBox(width: AppSpacing.s2),
            Expanded(
              child: Text(
                message ?? context.l10n.offlineBanner,
                style: context.typo.caption.copyWith(color: colors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
