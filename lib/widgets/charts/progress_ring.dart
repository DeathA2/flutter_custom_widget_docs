import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/charts/progress_bar.dart';

/// Circular progress ring — same trap and same fix as [ProgressBar].
@docWidget
class ProgressRing extends StatefulWidget {
  const ProgressRing({
    required this.fraction,
    required this.identity,
    this.color = CustomColors.brand,
    this.trackColor = CustomColors.neutral200,
    this.size = 96,
    this.strokeWidth = 8,
    this.center,
    this.gradientColors,
    super.key,
  });

  final double fraction;
  final Object identity;
  final Color color;
  final Color trackColor;
  final double size;
  final double strokeWidth;

  /// Drawn inside the ring — an avatar, a level number, anything.
  final Widget? center;

  /// Two or more colours sweeps a gradient along the arc.
  final List<Color>? gradientColors;

  @override
  State<ProgressRing> createState() => _ProgressRingState();
}

class _ProgressRingState extends State<ProgressRing> {
  late double _displayFraction;

  @override
  void initState() {
    super.initState();
    _displayFraction = widget.fraction;
  }

  @override
  void didUpdateWidget(covariant ProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.identity != widget.identity) {
      setState(() => _displayFraction = widget.fraction);
    } else if (oldWidget.fraction != widget.fraction) {
      setState(() => _displayFraction = oldWidget.fraction);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: TweenAnimationBuilder<double>(
        key: ValueKey<String>('${widget.identity}-${widget.fraction}'),
        tween: Tween<double>(
          begin: reduceMotion ? widget.fraction : _displayFraction,
          end: widget.fraction,
        ),
        duration: Duration(milliseconds: reduceMotion ? 0 : 600),
        curve: Curves.easeOutCubic,
        builder: (BuildContext context, double value, Widget? child) {
          return CustomPaint(
            painter: _RingPainter(
              fraction: value,
              color: widget.color,
              trackColor: widget.trackColor,
              strokeWidth: widget.strokeWidth,
              gradientColors: widget.gradientColors,
            ),
            child: Center(child: child),
          );
        },
        child: widget.center,
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.fraction,
    required this.color,
    required this.trackColor,
    required this.strokeWidth,
    this.gradientColors,
  });

  final double fraction;
  final Color color;
  final Color trackColor;
  final double strokeWidth;
  final List<Color>? gradientColors;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Rect arcRect = rect.deflate(strokeWidth / 2);

    canvas.drawArc(
      arcRect,
      0,
      math.pi * 2,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = trackColor,
    );

    if (fraction <= 0) return;

    final Paint progress = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final List<Color>? gradient = gradientColors;
    if (gradient == null || gradient.length < 2) {
      progress.color = color;
    } else {
      progress.shader = SweepGradient(
        colors: <Color>[...gradient, gradient.first],
        startAngle: 0,
        endAngle: math.pi * 2,
        transform: const GradientRotation(-math.pi / 2),
      ).createShader(arcRect);
    }

    canvas.drawArc(
      arcRect,
      -math.pi / 2,
      math.pi * 2 * fraction.clamp(0.0, 1.0),
      false,
      progress,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.fraction != fraction ||
      old.color != color ||
      old.trackColor != trackColor ||
      old.strokeWidth != strokeWidth ||
      !listEquals(old.gradientColors, gradientColors);
}
