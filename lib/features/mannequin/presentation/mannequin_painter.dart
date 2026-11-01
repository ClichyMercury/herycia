import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../domain/body_silhouette.dart';
import '../domain/garment_shape.dart';
import '../domain/mannequin_outfit.dart';

class MannequinPainter extends CustomPainter {
  MannequinPainter({
    required this.silhouette,
    required this.outfit,
    required this.bodyColor,
    required this.outlineColor,
  });

  static const canvasSize = Size(200, 440);

  final BodySilhouette silhouette;
  final MannequinOutfit outfit;
  final Color bodyColor;
  final Color outlineColor;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = math.min(size.width / canvasSize.width, size.height / canvasSize.height);
    canvas
      ..save()
      ..translate(
        (size.width - canvasSize.width * scale) / 2,
        (size.height - canvasSize.height * scale) / 2,
      )
      ..scale(scale);

    final g = _Geometry(silhouette);
    _paintBody(canvas, g);

    final top = outfit.top;
    if (top != null && !top.shape.isLayeredOverBottom) _paintTop(canvas, g, top);
    if (outfit.bottom case final bottom?) _paintBottom(canvas, g, bottom);
    if (outfit.onePiece case final onePiece?) _paintOnePiece(canvas, g, onePiece);
    if (top != null && top.shape.isLayeredOverBottom) _paintTop(canvas, g, top);
    if (outfit.outerwear case final outerwear?) _paintTop(canvas, g, outerwear);
    if (outfit.shoes case final shoes?) _paintShoes(canvas, g, shoes);

    const order = [
      GarmentShape.necklace,
      GarmentShape.tie,
      GarmentShape.scarf,
      GarmentShape.belt,
      GarmentShape.watch,
      GarmentShape.glasses,
      GarmentShape.bag,
    ];
    for (final shape in order) {
      if (outfit.accessory(shape) case final layer?) _paintAccessory(canvas, g, layer);
    }

    canvas.restore();
  }

  void _paintBody(Canvas canvas, _Geometry g) {
    final body = Path()
      ..addOval(Rect.fromCircle(center: g.head, radius: 20))
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTRB(g.cx - 7, 50, g.cx + 7, 74),
        const Radius.circular(4),
      ));
    var union = Path.combine(PathOperation.union, body, smoothPolygon(g.torsoPoints()));
    for (final side in [-1.0, 1.0]) {
      union = Path.combine(PathOperation.union, union, limb(g.armCenters(side), const [8, 7, 5.5]));
      union = Path.combine(PathOperation.union, union, limb(g.legCenters(side), g.legWidths));
      union = Path.combine(
        PathOperation.union,
        union,
        Path()..addOval(Rect.fromCircle(center: g.hand(side), radius: 7.5)),
      );
      union = Path.combine(
        PathOperation.union,
        union,
        Path()..addOval(Rect.fromCenter(center: g.foot(side), width: 22, height: 10)),
      );
    }
    _fillAndStroke(canvas, union, bodyColor, outlineColor);
  }

  void _paintTop(Canvas canvas, _Geometry g, MannequinLayer layer) {
    final shape = layer.shape;
    final outer = shape == GarmentShape.outerwear;
    final hemY = outer ? 236.0 : 220.0;
    final hemHalf = g.s.hip + (outer ? 8 : 4);
    var path = smoothPolygon([
      Offset(g.cx - 14, 66),
      Offset(g.cx - g.s.shoulder + 4, g.shoulderY - 4),
      Offset(g.cx - g.s.shoulder - 3, g.shoulderY + 10),
      Offset(g.cx - g.s.chest - 4, g.chestY),
      Offset(g.cx - g.s.waist - (outer ? 7 : 4), g.waistY),
      Offset(g.cx - hemHalf, hemY),
      Offset(g.cx + hemHalf, hemY),
      Offset(g.cx + g.s.waist + (outer ? 7 : 4), g.waistY),
      Offset(g.cx + g.s.chest + 4, g.chestY),
      Offset(g.cx + g.s.shoulder + 3, g.shoulderY + 10),
      Offset(g.cx + g.s.shoulder - 4, g.shoulderY - 4),
      Offset(g.cx + 14, 66),
      Offset(g.cx, 80),
    ]);
    final longSleeve = shape != GarmentShape.shortSleeveTop &&
        shape != GarmentShape.collaredShortSleeve;
    for (final side in [-1.0, 1.0]) {
      final arm = g.armCenters(side);
      final sleeve = longSleeve
          ? limb(arm.sublist(0, 3), outer ? const [12, 10.5, 9] : const [11, 9.5, 8])
          : limb([arm[0], Offset.lerp(arm[0], arm[1], 0.5)!], const [11.5, 10.5]);
      path = Path.combine(PathOperation.union, path, sleeve);
    }
    _fillAndStroke(canvas, path, layer.color, _shade(layer.color));

    final detail = _detailPaint(layer.color);
    if (shape == GarmentShape.collaredLongSleeve || shape == GarmentShape.collaredShortSleeve) {
      canvas
        ..drawPath(
          Path()
            ..moveTo(g.cx - 14, 66)
            ..lineTo(g.cx - 6, 86)
            ..lineTo(g.cx, 78)
            ..lineTo(g.cx + 6, 86)
            ..lineTo(g.cx + 14, 66),
          detail,
        )
        ..drawLine(Offset(g.cx, 80), Offset(g.cx, hemY - 4), detail);
    }
    if (outer) {
      canvas.drawPath(
        Path()
          ..moveTo(g.cx - 14, 66)
          ..lineTo(g.cx - 4, 150)
          ..lineTo(g.cx - 4, hemY)
          ..moveTo(g.cx + 14, 66)
          ..lineTo(g.cx + 4, 150)
          ..lineTo(g.cx + 4, hemY)
          ..moveTo(g.cx - 14, 66)
          ..lineTo(g.cx - 22, 104)
          ..lineTo(g.cx - 10, 120)
          ..moveTo(g.cx + 14, 66)
          ..lineTo(g.cx + 22, 104)
          ..lineTo(g.cx + 10, 120),
        detail,
      );
    }
  }

  Path _trousers(_Geometry g, {required double hemY, double flare = 0}) {
    var path = smoothPolygon([
      Offset(g.cx - g.s.waist - 3, g.waistY - 4),
      Offset(g.cx + g.s.waist + 3, g.waistY - 4),
      Offset(g.cx + g.s.hip + 4, g.hipY),
      Offset(g.cx + 2, g.crotchY + 6),
      Offset(g.cx - 2, g.crotchY + 6),
      Offset(g.cx - g.s.hip - 4, g.hipY),
    ]);
    for (final side in [-1.0, 1.0]) {
      final leg = g.legCenters(side);
      final t = ((hemY - leg.first.dy) / (leg.last.dy - leg.first.dy)).clamp(0.0, 1.0);
      final centers = t <= 0.55
          ? [leg[0], Offset.lerp(leg[0], leg[1], t / 0.55)!]
          : [leg[0], leg[1], Offset.lerp(leg[1], leg[2], (t - 0.55) / 0.45)!];
      final widths = [
        g.legWidths[0] + 4,
        g.legWidths[1] + 4,
        if (centers.length == 3) g.legWidths[2] + 4 + flare,
      ];
      path = Path.combine(PathOperation.union, path, limb(centers, widths));
    }
    return path;
  }

  void _paintBottom(Canvas canvas, _Geometry g, MannequinLayer layer) {
    final path = switch (layer.shape) {
      GarmentShape.trousers => _trousers(g, hemY: g.ankleY - 6, flare: 1),
      GarmentShape.shorts => _trousers(g, hemY: 290),
      _ => smoothPolygon([
          Offset(g.cx - g.s.waist - 3, g.waistY - 4),
          Offset(g.cx + g.s.waist + 3, g.waistY - 4),
          Offset(g.cx + g.s.hip + 5, g.hipY),
          Offset(g.cx + g.s.hip + 14, 306),
          Offset(g.cx - g.s.hip - 14, 306),
          Offset(g.cx - g.s.hip - 5, g.hipY),
        ], sharp: const {0, 1, 3, 4}),
    };
    _fillAndStroke(canvas, path, layer.color, _shade(layer.color));
  }

  void _paintOnePiece(Canvas canvas, _Geometry g, MannequinLayer layer) {
    final bodiceTop = [
      Offset(g.cx - g.s.chest + 2, 92),
      Offset(g.cx, 100),
      Offset(g.cx + g.s.chest - 2, 92),
      Offset(g.cx + g.s.chest + 3, g.chestY + 6),
      Offset(g.cx + g.s.waist + 3, g.waistY),
    ];
    final bodiceBottomLeft = [
      Offset(g.cx - g.s.waist - 3, g.waistY),
      Offset(g.cx - g.s.chest - 3, g.chestY + 6),
    ];
    final Path path;
    if (layer.shape == GarmentShape.jumpsuit) {
      final bodice = smoothPolygon(
        [...bodiceTop, Offset(g.cx + g.s.waist + 3, g.waistY + 6), Offset(g.cx - g.s.waist - 3, g.waistY + 6), ...bodiceBottomLeft],
        sharp: const {0, 2, 5, 6},
      );
      path = Path.combine(PathOperation.union, bodice, _trousers(g, hemY: g.ankleY - 6, flare: 2));
    } else {
      path = smoothPolygon([
        ...bodiceTop,
        Offset(g.cx + g.s.hip + 8, g.hipY),
        Offset(g.cx + g.s.hip + 26, 326),
        Offset(g.cx - g.s.hip - 26, 326),
        Offset(g.cx - g.s.hip - 8, g.hipY),
        ...bodiceBottomLeft,
      ], sharp: const {0, 2, 4, 6, 7, 9});
    }
    _fillAndStroke(canvas, path, layer.color, _shade(layer.color));
    final strap = Paint()
      ..color = layer.color
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    for (final side in [-1.0, 1.0]) {
      canvas.drawLine(
        Offset(g.cx + side * (g.s.shoulder - 16), g.shoulderY - 2),
        Offset(g.cx + side * (g.s.chest - 8), 96),
        strap,
      );
    }
  }

  void _paintShoes(Canvas canvas, _Geometry g, MannequinLayer layer) {
    final outline = _shade(layer.color);
    for (final side in [-1.0, 1.0]) {
      final foot = g.foot(side);
      switch (layer.shape) {
        case GarmentShape.boots:
          final shaft = RRect.fromRectAndRadius(
            Rect.fromCenter(center: foot.translate(0, -16), width: 20, height: 34),
            const Radius.circular(5),
          );
          final path = Path.combine(
            PathOperation.union,
            Path()..addRRect(shaft),
            Path()
              ..addRRect(RRect.fromRectAndRadius(
                Rect.fromCenter(center: foot.translate(side * 2, 1), width: 30, height: 14),
                const Radius.circular(7),
              )),
          );
          _fillAndStroke(canvas, path, layer.color, outline);
        case GarmentShape.sandals:
          final strap = Paint()
            ..color = layer.color
            ..strokeWidth = 3
            ..strokeCap = StrokeCap.round;
          _fillAndStroke(
            canvas,
            Path()..addRRect(RRect.fromRectAndRadius(
                Rect.fromCenter(center: foot.translate(side * 2, 5), width: 30, height: 5),
                const Radius.circular(3),
              )),
            layer.color,
            outline,
          );
          canvas
            ..drawLine(foot.translate(-9, -3), foot.translate(9, -3), strap)
            ..drawLine(foot.translate(-6, -9), foot.translate(6, -9), strap);
        default:
          _fillAndStroke(
            canvas,
            Path()..addRRect(RRect.fromRectAndRadius(
                Rect.fromCenter(center: foot.translate(side * 2, 0), width: 30, height: 15),
                const Radius.circular(7.5),
              )),
            layer.color,
            outline,
          );
      }
    }
  }

  void _paintAccessory(Canvas canvas, _Geometry g, MannequinLayer layer) {
    final color = layer.color;
    final outline = _shade(color);
    switch (layer.shape) {
      case GarmentShape.belt:
        final rect = Rect.fromLTRB(
          g.cx - g.s.waist - 5,
          g.waistY - 8,
          g.cx + g.s.waist + 5,
          g.waistY + 1,
        );
        _fillAndStroke(canvas, Path()..addRect(rect), color, outline);
        canvas.drawRect(
          Rect.fromCenter(center: rect.center, width: 10, height: 7),
          _detailPaint(color),
        );
      case GarmentShape.bag:
        final bag = Rect.fromLTWH(g.cx + g.s.hip + 4, 206, 32, 28);
        canvas.drawLine(
          Offset(g.cx + g.s.shoulder - 10, g.shoulderY - 2),
          Offset(bag.center.dx, bag.top),
          Paint()
            ..color = outline
            ..strokeWidth = 2.5
            ..strokeCap = StrokeCap.round,
        );
        _fillAndStroke(
          canvas,
          Path()..addRRect(RRect.fromRectAndRadius(bag, const Radius.circular(5))),
          color,
          outline,
        );
      case GarmentShape.watch:
        final wrist = g.armCenters(-1)[2];
        _fillAndStroke(
          canvas,
          Path()
            ..addRRect(RRect.fromRectAndRadius(
              Rect.fromCenter(center: wrist, width: 15, height: 8),
              const Radius.circular(2),
            )),
          color,
          outline,
        );
      case GarmentShape.necklace:
        canvas
          ..drawPath(
            Path()
              ..moveTo(g.cx - 13, 68)
              ..quadraticBezierTo(g.cx, 104, g.cx + 13, 68),
            Paint()
              ..color = color
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2.5,
          )
          ..drawCircle(Offset(g.cx, 87), 4, Paint()..color = color)
          ..drawCircle(
            Offset(g.cx, 87),
            4,
            Paint()
              ..color = outline
              ..style = PaintingStyle.stroke,
          );
      case GarmentShape.glasses:
        final lens = Paint()..color = color;
        final frame = Paint()
          ..color = outline
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5;
        for (final dx in [-9.0, 9.0]) {
          final r = RRect.fromRectAndRadius(
            Rect.fromCenter(center: g.head.translate(dx, -3), width: 14, height: 9),
            const Radius.circular(3),
          );
          canvas
            ..drawRRect(r, lens)
            ..drawRRect(r, frame);
        }
        canvas.drawLine(g.head.translate(-2, -4), g.head.translate(2, -4), frame);
      case GarmentShape.scarf:
        final path = Path.combine(
          PathOperation.union,
          Path()
            ..addRRect(RRect.fromRectAndRadius(
              Rect.fromLTRB(g.cx - 17, 60, g.cx + 17, 76),
              const Radius.circular(8),
            )),
          limb([Offset(g.cx + 8, 70), Offset(g.cx + 12, 112), Offset(g.cx + 10, 150)], const [6, 6, 6]),
        );
        _fillAndStroke(canvas, path, color, outline);
      case GarmentShape.tie:
        final path = Path()
          ..moveTo(g.cx - 5, 76)
          ..lineTo(g.cx + 5, 76)
          ..lineTo(g.cx + 3, 86)
          ..lineTo(g.cx + 8, 164)
          ..lineTo(g.cx, 174)
          ..lineTo(g.cx - 8, 164)
          ..lineTo(g.cx - 3, 86)
          ..close();
        _fillAndStroke(canvas, path, color, outline);
      default:
        break;
    }
  }

  void _fillAndStroke(Canvas canvas, Path path, Color fill, Color stroke) {
    canvas
      ..drawPath(path, Paint()..color = fill)
      ..drawPath(
        path,
        Paint()
          ..color = stroke
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..strokeJoin = StrokeJoin.round,
      );
  }

  Paint _detailPaint(Color base) => Paint()
    ..color = _shade(base)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.2
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  static Color _shade(Color c) {
    final luminance = c.computeLuminance();
    return luminance < 0.08
        ? Color.lerp(c, Colors.white, 0.28)!
        : Color.lerp(c, Colors.black, 0.32)!;
  }

  @override
  bool shouldRepaint(MannequinPainter old) =>
      old.silhouette != silhouette ||
      old.outfit != outfit ||
      old.bodyColor != bodyColor ||
      old.outlineColor != outlineColor;
}

class _Geometry {
  _Geometry(this.s);

  final BodySilhouette s;

  final cx = 100.0;
  final head = const Offset(100, 32);
  final shoulderY = 78.0;
  final chestY = 112.0;
  final waistY = 180.0;
  final hipY = 214.0;
  final crotchY = 238.0;
  final ankleY = 404.0;

  List<double> get legWidths => [s.hip / 2 + 1, 11, 6.5];

  List<Offset> torsoPoints() => [
        Offset(cx - 12, 68),
        Offset(cx - s.shoulder + 6, shoulderY - 2),
        Offset(cx - s.shoulder, shoulderY + 10),
        Offset(cx - s.chest, chestY),
        Offset(cx - s.waist, waistY),
        Offset(cx - s.hip, hipY),
        Offset(cx - 2, crotchY),
        Offset(cx + 2, crotchY),
        Offset(cx + s.hip, hipY),
        Offset(cx + s.waist, waistY),
        Offset(cx + s.chest, chestY),
        Offset(cx + s.shoulder, shoulderY + 10),
        Offset(cx + s.shoulder - 6, shoulderY - 2),
        Offset(cx + 12, 68),
      ];

  List<Offset> armCenters(double side) => [
        Offset(cx + side * (s.shoulder - 3), shoulderY + 8),
        Offset(cx + side * (s.shoulder + 5), 150),
        Offset(cx + side * (s.shoulder + 8), 214),
      ];

  Offset hand(double side) => Offset(cx + side * (s.shoulder + 9), 226);

  List<Offset> legCenters(double side) => [
        Offset(cx + side * (s.hip / 2 + 1), hipY - 4),
        Offset(cx + side * (13 + s.hip * 0.1), 322),
        Offset(cx + side * 16, ankleY),
      ];

  Offset foot(double side) => Offset(cx + side * 17, ankleY + 6);
}

Path smoothPolygon(List<Offset> points, {Set<int> sharp = const {}}) {
  final path = Path();
  final n = points.length;
  Offset mid(int i) => Offset.lerp(points[i % n], points[(i + 1) % n], 0.5)!;
  final start = mid(n - 1);
  path.moveTo(start.dx, start.dy);
  for (var i = 0; i < n; i++) {
    final m = mid(i);
    if (sharp.contains(i)) {
      path
        ..lineTo(points[i].dx, points[i].dy)
        ..lineTo(m.dx, m.dy);
    } else {
      path.quadraticBezierTo(points[i].dx, points[i].dy, m.dx, m.dy);
    }
  }
  return path..close();
}

Path limb(List<Offset> centers, List<double> halfWidths) {
  assert(centers.length == halfWidths.length && centers.length >= 2);
  final left = <Offset>[];
  final right = <Offset>[];
  for (var i = 0; i < centers.length; i++) {
    final prev = centers[math.max(0, i - 1)];
    final next = centers[math.min(centers.length - 1, i + 1)];
    final dir = next - prev;
    final length = dir.distance == 0 ? 1.0 : dir.distance;
    final normal = Offset(-dir.dy / length, dir.dx / length) * halfWidths[i];
    left.add(centers[i] + normal);
    right.add(centers[i] - normal);
  }
  final path = Path()..moveTo(left.first.dx, left.first.dy);
  for (final p in left.skip(1)) {
    path.lineTo(p.dx, p.dy);
  }
  path.arcToPoint(right.last, radius: Radius.circular(halfWidths.last), clockwise: false);
  for (final p in right.reversed.skip(1)) {
    path.lineTo(p.dx, p.dy);
  }
  path.arcToPoint(left.first, radius: Radius.circular(halfWidths.first), clockwise: false);
  return path..close();
}
