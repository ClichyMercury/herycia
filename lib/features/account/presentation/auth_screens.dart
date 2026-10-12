import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/api/api_exception.dart';
import '../../../core/api/api_providers.dart';
import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../../../mock_backend/mock_api_client.dart';
import '../application/account_providers.dart';
import '../application/session_controller.dart';
import '../domain/account_models.dart';

final _emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

mixin _FormErrors<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  Map<String, String> fieldErrors = {};
  String? globalError;
  bool busy = false;

  Future<void> run(Future<void> Function() action) async {
    setState(() {
      busy = true;
      globalError = null;
      fieldErrors = {};
    });
    try {
      await action();
    } on ApiException catch (e) {
      if (!mounted) return;
      setState(() {
        fieldErrors = {for (final entry in e.fieldErrors.entries) entry.key: entry.value.first};
        if (fieldErrors.isEmpty) globalError = errorText(e, context.l10n);
      });
    } catch (e) {
      if (mounted) setState(() => globalError = errorText(e, context.l10n));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }

  bool validate(Map<String, String?> checks) {
    final errors = {for (final e in checks.entries) if (e.value != null) e.key: e.value!};
    setState(() => fieldErrors = errors);
    return errors.isEmpty;
  }

  String? emailError(String value) {
    if (value.trim().isEmpty) return context.l10n.authRequired;
    if (!_emailPattern.hasMatch(value.trim())) return context.l10n.authEmailInvalid;
    return null;
  }

  String? passwordError(String value) => value.length < 8 ? context.l10n.authPasswordRule : null;

  Widget globalErrorBanner() => globalError == null
      ? const SizedBox.shrink()
      : Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.s4),
          child: Text(globalError!, style: context.typo.body.copyWith(color: context.colors.danger)),
        );
}

class _AuthScaffold extends StatelessWidget {
  const _AuthScaffold({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: AutofillGroup(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(AppSpacing.screenHorizontal, AppSpacing.s2, AppSpacing.screenHorizontal, AppSpacing.s8),
          children: children,
        ),
      ),
    );
  }
}

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> with _FormErrors {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!validate({'email': emailError(_email.text), 'password': _password.text.isEmpty ? context.l10n.authRequired : null})) {
      return;
    }
    await run(() async {
      final user = await ref.read(sessionProvider.notifier).login(_email.text, _password.text);
      if (!mounted) return;
      showAppToast(context, message: context.l10n.authWelcome(user.name));
      context.go(AppRoutes.profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _AuthScaffold(
      title: l10n.authLoginTitle,
      children: [
        globalErrorBanner(),
        AppTextField(
          key: const ValueKey('login-email'),
          label: l10n.authEmail,
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          errorText: fieldErrors['email'],
        ),
        const SizedBox(height: AppSpacing.s4),
        AppTextField(
          key: const ValueKey('login-password'),
          label: l10n.authPassword,
          controller: _password,
          obscure: true,
          autofillHints: const [AutofillHints.password],
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _submit(),
          errorText: fieldErrors['password'],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AppButton(
            label: l10n.authForgotLink,
            variant: AppButtonVariant.ghost,
            size: AppButtonSize.sm,
            onPressed: () => context.go(AppRoutes.forgotPassword),
          ),
        ),
        const SizedBox(height: AppSpacing.s4),
        AppButton(key: const ValueKey('login-submit'), label: l10n.authLoginAction, isLoading: busy, onPressed: _submit),
        AppButton(
          label: l10n.authNoAccount,
          variant: AppButtonVariant.ghost,
          onPressed: () => context.go(AppRoutes.register),
        ),
      ],
    );
  }
}

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> with _FormErrors {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _accepts = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = context.l10n;
    if (!validate({
      'name': _name.text.trim().isEmpty ? l10n.authRequired : null,
      'email': emailError(_email.text),
      'password': passwordError(_password.text),
      'accepts_privacy_policy': _accepts ? null : l10n.authAcceptPrivacy,
    })) {
      return;
    }
    await run(() async {
      final user = await ref.read(sessionProvider.notifier).register(
            name: _name.text,
            email: _email.text,
            password: _password.text,
            acceptsPrivacyPolicy: _accepts,
          );
      if (!mounted) return;
      showAppToast(context, message: context.l10n.authWelcome(user.name));
      context.go(AppRoutes.profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return _AuthScaffold(
      title: l10n.authRegisterTitle,
      children: [
        globalErrorBanner(),
        AppTextField(
          key: const ValueKey('register-name'),
          label: l10n.authName,
          controller: _name,
          autofillHints: const [AutofillHints.nickname],
          textInputAction: TextInputAction.next,
          errorText: fieldErrors['name'],
        ),
        const SizedBox(height: AppSpacing.s4),
        AppTextField(
          key: const ValueKey('register-email'),
          label: l10n.authEmail,
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          textInputAction: TextInputAction.next,
          errorText: fieldErrors['email'],
        ),
        const SizedBox(height: AppSpacing.s4),
        AppTextField(
          key: const ValueKey('register-password'),
          label: l10n.authPassword,
          hint: l10n.authPasswordRule,
          controller: _password,
          obscure: true,
          autofillHints: const [AutofillHints.newPassword],
          errorText: fieldErrors['password'] ?? fieldErrors['password_confirmation'],
        ),
        const SizedBox(height: AppSpacing.s3),
        CheckboxListTile(
          key: const ValueKey('register-privacy'),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          value: _accepts,
          activeColor: colors.actionPrimary,
          onChanged: (v) => setState(() => _accepts = v ?? false),
          title: Text(l10n.authAcceptPrivacy, style: context.typo.body.copyWith(color: colors.textPrimary)),
          subtitle: fieldErrors['accepts_privacy_policy'] == null
              ? null
              : Text(fieldErrors['accepts_privacy_policy']!, style: context.typo.caption.copyWith(color: colors.danger)),
        ),
        AppButton(
          label: l10n.privacyTitle,
          variant: AppButtonVariant.ghost,
          size: AppButtonSize.sm,
          onPressed: () => context.push(AppRoutes.privacy),
        ),
        const SizedBox(height: AppSpacing.s4),
        AppButton(key: const ValueKey('register-submit'), label: l10n.authRegisterAction, isLoading: busy, onPressed: _submit),
        AppButton(
          label: l10n.authHaveAccount,
          variant: AppButtonVariant.ghost,
          onPressed: () => context.go(AppRoutes.login),
        ),
      ],
    );
  }
}

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> with _FormErrors {
  final _email = TextEditingController();
  bool _sent = false;
  String? _demoCode;

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!validate({'email': emailError(_email.text)})) return;
    await run(() async {
      await ref.read(authRepositoryProvider).forgotPassword(_email.text.trim());
      final client = ref.read(apiClientProvider);
      String? code;
      if (ref.read(showDevToolsProvider) && client is MockApiClient) {
        code = (await client.backend).resetTokens[_email.text.trim().toLowerCase()];
      }
      if (mounted) {
        setState(() {
          _sent = true;
          _demoCode = code;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    return _AuthScaffold(
      title: l10n.authForgotTitle,
      children: [
        Text(l10n.authForgotIntro, style: context.typo.body.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.s4),
        globalErrorBanner(),
        AppTextField(
          key: const ValueKey('forgot-email'),
          label: l10n.authEmail,
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          errorText: fieldErrors['email'],
        ),
        const SizedBox(height: AppSpacing.s4),
        if (_sent) ...[
          Text(l10n.authForgotSent, key: const ValueKey('forgot-sent'), style: context.typo.body.copyWith(color: colors.success)),
          if (_demoCode != null) ...[
            const SizedBox(height: AppSpacing.s2),
            AppBadge(label: l10n.authDemoCode(_demoCode!)),
          ],
          const SizedBox(height: AppSpacing.s4),
          AppButton(
            key: const ValueKey('forgot-have-code'),
            label: l10n.authHaveCode,
            onPressed: () => context.go(AppRoutes.resetPassword, extra: _email.text.trim()),
          ),
        ] else
          AppButton(key: const ValueKey('forgot-submit'), label: l10n.authForgotAction, isLoading: busy, onPressed: _submit),
      ],
    );
  }
}

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key, this.email});

  final String? email;

  @override
  ConsumerState<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> with _FormErrors {
  late final _email = TextEditingController(text: widget.email);
  final _code = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _code.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!validate({
      'email': emailError(_email.text),
      'token': _code.text.trim().isEmpty ? context.l10n.authRequired : null,
      'password': passwordError(_password.text),
    })) {
      return;
    }
    await run(() async {
      await ref.read(authRepositoryProvider).resetPassword(ResetPasswordRequest(
            email: _email.text.trim(),
            token: _code.text.trim(),
            password: _password.text,
            passwordConfirmation: _password.text,
          ));
      if (!mounted) return;
      showAppToast(context, message: context.l10n.authResetDone);
      context.go(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return _AuthScaffold(
      title: l10n.authResetTitle,
      children: [
        globalErrorBanner(),
        AppTextField(label: l10n.authEmail, controller: _email, keyboardType: TextInputType.emailAddress, errorText: fieldErrors['email']),
        const SizedBox(height: AppSpacing.s4),
        AppTextField(key: const ValueKey('reset-code'), label: l10n.authResetCode, controller: _code, errorText: fieldErrors['token']),
        const SizedBox(height: AppSpacing.s4),
        AppTextField(
          key: const ValueKey('reset-password'),
          label: l10n.authResetNewPassword,
          hint: l10n.authPasswordRule,
          controller: _password,
          obscure: true,
          autofillHints: const [AutofillHints.newPassword],
          errorText: fieldErrors['password'] ?? fieldErrors['password_confirmation'],
        ),
        const SizedBox(height: AppSpacing.s6),
        AppButton(key: const ValueKey('reset-submit'), label: l10n.authResetAction, isLoading: busy, onPressed: _submit),
      ],
    );
  }
}
