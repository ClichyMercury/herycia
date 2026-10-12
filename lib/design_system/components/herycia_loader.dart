import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../theme/theme_context.dart';

enum LoaderSize {
  sm(7, hook: false),
  md(14, hook: false),
  lg(12, hook: true);

  const LoaderSize(this.ringRadius, {required this.hook});

  final double ringRadius;
  final bool hook;
}

class HeryciaLoader extends StatefulWidget {
  const HeryciaLoader({
    super.key,
    this.size = LoaderSize.md,
    this.color,
    this.semanticsLabel,
  });

  static const period = Duration(milliseconds: 1400);

  final LoaderSize size;
  final Color? color;
  final String? semanticsLabel;

  @override
  State<HeryciaLoader> createState() => _HeryciaLoaderState();
}

class _HeryciaLoaderState extends State<HeryciaLoader> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: HeryciaLoader.period);

  bool get _reduced => MediaQuery.maybeDisableAnimationsOf(context) ?? false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_reduced) {
      _controller.stop();
    } else if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final mono = widget.color;
    LoaderPainter painter(double t) => LoaderPainter(
          progress: t,
          animated: !_reduced,
          ring: mono ?? colors.brandMark,
          ringSoft: mono?.withValues(alpha: 0.55) ?? colors.brandMarkSoft,
          accent: mono ?? colors.accent,
          hook: widget.size.hook,
        );
    final size = LoaderPainter.extent(widget.size.ringRadius, hook: widget.size.hook);
    return Semantics(
      label: widget.semanticsLabel ?? context.l10n.commonLoading,
      liveRegion: true,
      child: ExcludeSemantics(
        child: SizedBox.fromSize(
          size: size,
          child: _reduced
              ? CustomPaint(painter: painter(0))
              : AnimatedBuilder(
                  animation: _controller,
                  builder: (context, _) => CustomPaint(painter: painter(_controller.value)),
                ),
        ),
      ),
    );
  }
}

class LoaderPainter extends CustomPainter {
  LoaderPainter({
    required this.progress,
    required this.animated,
    required this.ring,
    required this.ringSoft,
    required this.accent,
    required this.hook,
  });

  static const _overlap = 0.62;
  static const _stroke = 0.32;
  static const _armSpan = 2.9;
  static const _armBase = 0.9;
  static const _hookRadius = 0.42;
  static const _hookCenter = -2.05;

  final double progress;
  final bool animated;
  final Color ring;
  final Color ringSoft;
  final Color accent;
  final bool hook;

  static double _halfWidth({required bool hook}) => (hook ? _armSpan : _overlap + 1) + _stroke / 2;

  static double _top({required bool hook}) => hook ? -(_hookCenter - _hookRadius) + _stroke / 2 : 1.45;

  static double _bottom({required bool hook}) => (hook ? _armBase : 1) + _stroke / 2;

  static Size extent(double r, {required bool hook}) =>
      Size(2 * _halfWidth(hook: hook) * r, (_top(hook: hook) + _bottom(hook: hook)) * r);

  @override
  void paint(Canvas canvas, Size size) {
    final r = size.width / (2 * _halfWidth(hook: hook));
    final cx = size.width / 2;
    final cy = _top(hook: hook) * r;
    final left = Offset(cx - _overlap * r, cy);
    final right = Offset(cx + _overlap * r, cy);

    Paint pen(Color color) => Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = _stroke * r
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final turn = 2 * math.pi * progress;
    final breathe = animated ? 0.5 + 0.5 * math.sin(turn) : 1.0;
    final sweep = animated ? math.pi * (0.9 + 0.7 * breathe) : 2 * math.pi;

    if (hook) {
      final base = cy + _armBase * r;
      canvas
        ..drawPath(
          Path()
            ..moveTo(cx - 0.35 * r, cy - 0.95 * r)
            ..lineTo(cx - _armSpan * r, base)
            ..lineTo(cx - 1.05 * r, base),
          pen(ring),
        )
        ..drawPath(
          Path()
            ..moveTo(cx + 0.45 * r, cy - 0.95 * r)
            ..lineTo(cx + _armSpan * r, base)
            ..lineTo(cx + 1.05 * r, base),
          pen(ringSoft),
        )
        ..drawLine(Offset(cx - 0.1 * r, cy - 1.0 * r), Offset(cx + 0.05 * r, cy + (_hookCenter + _hookRadius) * r), pen(ring))
        ..drawArc(
          Rect.fromCircle(center: Offset(cx + 0.05 * r, cy + _hookCenter * r), radius: _hookRadius * r),
          math.pi / 2,
          -1.5 * math.pi,
          false,
          pen(ring),
        );
    }

    void track(Offset c, Color color) =>
        canvas.drawCircle(c, r, pen(color.withValues(alpha: animated ? 0.16 : 1)));
    void arc(Offset c, Color color, double start) =>
        canvas.drawArc(Rect.fromCircle(center: c, radius: r), start, sweep, false, pen(color));

    track(left, ring);
    track(right, ringSoft);
    if (animated) {
      final leftStart = turn - math.pi / 2;
      final rightStart = -turn + math.pi / 2;
      if (progress < 0.5) {
        arc(right, ringSoft, rightStart);
        arc(left, ring, leftStart);
      } else {
        arc(left, ring, leftStart);
        arc(right, ringSoft, rightStart);
      }
    }

    final pulse = animated ? 0.75 + 0.35 * breathe : 1.0;
    final tip = Offset(cx + 0.3 * r, cy - 1.22 * r);
    final t = 0.24 * r * pulse;
    canvas.drawPath(
      Path()
        ..moveTo(tip.dx - t, tip.dy + t * 0.6)
        ..lineTo(tip.dx + t, tip.dy + t * 0.6)
        ..lineTo(tip.dx, tip.dy - t * 0.9)
        ..close(),
      Paint()..color = accent,
    );
  }

  @override
  bool shouldRepaint(LoaderPainter old) =>
      old.progress != progress ||
      old.animated != animated ||
      old.ring != ring ||
      old.ringSoft != ringSoft ||
      old.accent != accent ||
      old.hook != hook;
}
