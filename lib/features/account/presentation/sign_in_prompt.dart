import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';

Future<void> showSignInPrompt(BuildContext context, String message) => showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, 0, AppSpacing.screenHorizontal, AppSpacing.s8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(message, style: sheetContext.typo.body.copyWith(color: sheetContext.colors.textPrimary)),
            const SizedBox(height: AppSpacing.s4),
            AppButton(
              key: const ValueKey('prompt-sign-in'),
              label: sheetContext.l10n.profileSignIn,
              onPressed: () {
                Navigator.of(sheetContext).pop();
                context.go(AppRoutes.login);
              },
            ),
            AppButton(
              label: sheetContext.l10n.commonLater,
              variant: AppButtonVariant.ghost,
              onPressed: () => Navigator.of(sheetContext).pop(),
            ),
          ],
        ),
      ),
    );
