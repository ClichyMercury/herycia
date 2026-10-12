import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/error_text.dart';
import '../../../design_system/design_system.dart';
import '../../../l10n/l10n.dart';
import '../application/recommendation_providers.dart';
import '../domain/recommendation_models.dart';

class FeedbackPrompt extends StatelessWidget {
  const FeedbackPrompt({super.key, required this.requestId, this.outfitId});

  final String requestId;
  final String? outfitId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    void open(bool helpful) => showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          builder: (_) => FeedbackSheet(requestId: requestId, outfitId: outfitId, initialHelpful: helpful),
        );
    return Row(
      children: [
        Expanded(
          child: Text(l10n.feedbackQuestion, style: context.typo.body.copyWith(color: context.colors.textSecondary)),
        ),
        AppButton(
          key: const ValueKey('feedback-helpful'),
          label: l10n.feedbackHelpful,
          variant: AppButtonVariant.ghost,
          size: AppButtonSize.sm,
          onPressed: () => open(true),
        ),
        AppButton(
          key: const ValueKey('feedback-not-helpful'),
          label: l10n.feedbackNotHelpful,
          variant: AppButtonVariant.ghost,
          size: AppButtonSize.sm,
          onPressed: () => open(false),
        ),
      ],
    );
  }
}

class FeedbackSheet extends ConsumerStatefulWidget {
  const FeedbackSheet({super.key, required this.requestId, required this.initialHelpful, this.outfitId});

  final String requestId;
  final String? outfitId;
  final bool initialHelpful;

  @override
  ConsumerState<FeedbackSheet> createState() => _FeedbackSheetState();
}

class _FeedbackSheetState extends ConsumerState<FeedbackSheet> {
  late bool _helpful = widget.initialHelpful;
  final _comment = TextEditingController();
  bool _sending = false;
  String? _error;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    setState(() {
      _sending = true;
      _error = null;
    });
    try {
      await ref.read(recommendationRepositoryProvider).sendFeedback(
            widget.requestId,
            FeedbackRequest(
              isHelpful: _helpful,
              outfitId: widget.outfitId,
              comment: _comment.text.trim().isEmpty ? null : _comment.text.trim(),
            ),
          );
      if (!mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      Navigator.of(context).pop();
      messenger.showSnackBar(SnackBar(content: Text(context.l10n.feedbackThanks)));
    } catch (e) {
      if (mounted) setState(() => _error = errorText(e, context.l10n));
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenHorizontal,
        0,
        AppSpacing.screenHorizontal,
        AppSpacing.s6 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.feedbackQuestion, style: context.typo.title3.copyWith(color: context.colors.textPrimary)),
          const SizedBox(height: AppSpacing.s3),
          Row(
            children: [
              AppChip(label: l10n.feedbackHelpful, selected: _helpful, onTap: () => setState(() => _helpful = true)),
              const SizedBox(width: AppSpacing.s2),
              AppChip(label: l10n.feedbackNotHelpful, selected: !_helpful, onTap: () => setState(() => _helpful = false)),
            ],
          ),
          const SizedBox(height: AppSpacing.s4),
          AppTextField(
            key: const ValueKey('feedback-comment'),
            label: l10n.feedbackCommentLabel,
            controller: _comment,
            errorText: _error,
          ),
          const SizedBox(height: AppSpacing.s4),
          AppButton(
            key: const ValueKey('feedback-send'),
            label: l10n.feedbackSend,
            isLoading: _sending,
            onPressed: _send,
          ),
        ],
      ),
    );
  }
}
