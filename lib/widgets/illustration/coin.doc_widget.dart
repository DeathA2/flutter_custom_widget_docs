// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class CoinDocWidget implements Documentation {
  @override
  String get name => 'Coin';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '44: 44.0',
    ),
    PropertyDoc(
      name: 'lifted',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.gold',
    ),
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Hand-drawn coin.
@docWidget
class Coin extends StatelessWidget {
  const Coin({
    this.size = 44,
    this.lifted = false,
    this.color = CustomColors.gold,
    super.key,
  });

  final double size;
  final bool lifted;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CoinPainter(lifted: lifted, color: color),
      ),
    );
  }
}

class _CoinPainter extends CustomPainter {
  const _CoinPainter({required this.lifted, required this.color});

  final bool lifted;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = size.center(Offset.zero);
    final double r = size.width * 0.38;

    if (lifted) {
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(c.dx, size.height * 0.86),
          width: size.width * 0.55,
          height: size.height * 0.16,
        ),
        Paint()..color = Colors.black.withValues(alpha: 0.18),
      );
    }

    canvas.drawCircle(c, r, Paint()..color = color);
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..color = Color.lerp(color, CustomColors.white, 0.45)!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    canvas.drawCircle(
      Offset(c.dx + size.width * 0.12, c.dy - size.height * 0.1),
      size.width * 0.05,
      Paint()..color = CustomColors.white.withValues(alpha: 0.9),
    );
  }

  @override
  bool shouldRepaint(covariant _CoinPainter old) =>
      old.lifted != lifted || old.color != color;
}
''';
}
