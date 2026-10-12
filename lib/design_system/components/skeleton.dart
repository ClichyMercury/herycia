import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';
import '../tokens/layout.dart';
import 'app_button.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({
    super.key,
    this.width,
    this.height,
    this.radius = AppRadius.lg,
    this.shape = BoxShape.rectangle,
  });

  const Skeleton.circle({super.key, required double size})
      : width = size,
        height = size,
        radius = AppRadius.full,
        shape = BoxShape.circle;

  static const pulse = Duration(milliseconds: 1200);

  final double? width;
  final double? height;
  final double radius;
  final BoxShape shape;

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Skeleton.pulse,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final reduce = MediaQuery.maybeDisableAnimationsOf(context) ?? false;
    if (reduce) {
      _controller.stop();
      _controller.value = 1;
    } else if (!_controller.isAnimating) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: FadeTransition(
        opacity: Tween<double>(begin: 0.55, end: 1).animate(_controller),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: context.colors.surfaceSunken,
            shape: widget.shape,
            borderRadius: widget.shape == BoxShape.circle
                ? null
                : BorderRadius.circular(widget.radius),
          ),
        ),
      ),
    );
  }
}

class SlowLoadingHint extends StatefulWidget {
  const SlowLoadingHint({super.key, required this.child, this.onCancel});

  static const threshold = Duration(seconds: 5);

  final Widget child;
  final VoidCallback? onCancel;

  @override
  State<SlowLoadingHint> createState() => _SlowLoadingHintState();
}

class _SlowLoadingHintState extends State<SlowLoadingHint> {
  bool _slow = false;
  late final Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(SlowLoadingHint.threshold, () {
      if (mounted) setState(() => _slow = true);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        widget.child,
        if (_slow) ...[
          const SizedBox(height: AppSpacing.s4),
          Text(
            context.l10n.commonSlowLoading,
            textAlign: TextAlign.center,
            style: context.typo.body.copyWith(color: context.colors.textSecondary),
          ),
          if (widget.onCancel != null)
            AppButton(
              label: context.l10n.commonCancel,
              onPressed: widget.onCancel,
              variant: AppButtonVariant.ghost,
              size: AppButtonSize.md,
            ),
        ],
      ],
    );
  }
}
