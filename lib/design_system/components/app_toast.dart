import 'package:flutter/material.dart';

import '../tokens/layout.dart';

const toastDuration = Duration(seconds: 3);

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showAppToast(
  BuildContext context, {
  required String message,
  String? actionLabel,
  VoidCallback? onAction,
}) {
  final messenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();
  return messenger.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: toastDuration,
      margin: const EdgeInsets.fromLTRB(
        AppSpacing.screenHorizontal,
        0,
        AppSpacing.screenHorizontal,
        AppSpacing.s4,
      ),
      action: actionLabel != null && onAction != null
          ? SnackBarAction(label: actionLabel, onPressed: onAction)
          : null,
    ),
  );
}
