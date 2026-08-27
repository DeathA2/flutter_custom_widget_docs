import 'dart:io';
import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Cross-platform loading indicator: Cupertino on iOS and macOS, Material
/// everywhere else.
@docWidget
class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({this.radius = 12, this.color, super.key});

  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color tint = color ?? CustomColors.brand;
    final bool cupertino =
        !kIsWebFallback && (Platform.isIOS || Platform.isMacOS);

    if (!cupertino) {
      return SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(tint),
        ),
      );
    }

    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: CustomPaint(painter: _CupertinoSpinnerPainter(color: tint)),
    );
  }

  /// `Platform` throws on web. This file does not import `flutter/foundation.dart`
  /// just for `kIsWeb`, so it uses this constant instead — `identical(0, 0.0)` is
  /// only true once compiled to JS.
  static bool get kIsWebFallback => identical(0, 0.0);
}

/// iOS-style spinner: 8 fading ticks, rotated by turning the canvas.
class _CupertinoSpinnerPainter extends CustomPainter {
  _CupertinoSpinnerPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    const int ticks = 8;
    final Offset centre = size.center(Offset.zero);
    final double outer = size.width / 2;
    final double inner = outer * 0.45;

    for (int i = 0; i < ticks; i++) {
      final double angle = (i / ticks) * math.pi * 2 - math.pi / 2;
      final Paint paint = Paint()
        ..color = color.withValues(alpha: 0.25 + 0.75 * (i / ticks))
        ..strokeWidth = size.width * 0.11
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
        centre + Offset(math.cos(angle) * inner, math.sin(angle) * inner),
        centre + Offset(math.cos(angle) * outer, math.sin(angle) * outer),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _CupertinoSpinnerPainter old) =>
      old.color != color;
}
