import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/app_icons.dart';
import '../tokens/layout.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.errorText,
    this.obscure = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
  });

  static const height = 56.0;

  final String label;
  final TextEditingController? controller;
  final String? hint;
  final String? errorText;
  final bool obscure;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _hidden = widget.obscure;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typo = context.typo;
    final hasError = widget.errorText != null;

    OutlineInputBorder border(Color color, double width) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: color, width: width),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.label, style: typo.label.copyWith(color: colors.textPrimary)),
        const SizedBox(height: AppSpacing.s2),
        TextField(
          controller: widget.controller,
          obscureText: _hidden,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          autofillHints: widget.autofillHints,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          style: typo.body.copyWith(color: colors.textPrimary),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: typo.body.copyWith(color: colors.textTertiary),
            filled: true,
            fillColor: colors.surface,
            isDense: true,
            constraints: const BoxConstraints(minHeight: AppTextField.height),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s4,
              vertical: AppSpacing.s4,
            ),
            enabledBorder: border(hasError ? colors.danger : colors.borderStrong, 1),
            focusedBorder: border(hasError ? colors.danger : colors.focusRing, 2),
            suffixIcon: widget.obscure
                ? IconButton(
                    tooltip: _hidden ? context.l10n.passwordShow : context.l10n.passwordHide,
                    onPressed: () => setState(() => _hidden = !_hidden),
                    icon: Icon(
                      _hidden ? AppIcons.showPassword : AppIcons.hidePassword,
                      color: colors.textSecondary,
                    ),
                  )
                : null,
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: AppSpacing.s2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(AppIcons.error, size: 16, color: colors.danger),
              const SizedBox(width: AppSpacing.s1),
              Expanded(
                child: Text(
                  widget.errorText!,
                  style: typo.caption.copyWith(color: colors.danger),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
