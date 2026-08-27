// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class GaugeMeterDocWidget implements Documentation {
  @override
  String get name => 'GaugeMeter';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'fraction',
      isRequired: true,
      isNamed: true,
      type: 'double',
    ),
    PropertyDoc(
      name: 'centerLabel',
      isRequired: true,
      isNamed: true,
      type: 'String',
      description: 'Pre-formatted, so the widget stays unaware of locale.',
    ),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '140: 140.0',
    ),
    PropertyDoc(
      name: 'gradientColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description:
          'Two or more colours sweep along the arc. Null uses\n [CustomColors.progressRing].',
    ),
    PropertyDoc(
      name: 'knob',
      isRequired: false,
      isNamed: true,
      type: 'Widget?',
      description:
          'Small widget riding the head of the arc. Null draws a white dot.',
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
  String get source => '''import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/foundation.dart' show listEquals;
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// 270° gauge with a gap at the bottom and a knob riding the arc.
@docWidget
class GaugeMeter extends StatefulWidget {
  const GaugeMeter({
    required this.fraction,
    required this.centerLabel,
    this.size = 140,
    this.gradientColors,
    this.knob,
    super.key,
  });

  final double fraction;

  /// Pre-formatted, so the widget stays unaware of locale.
  final String centerLabel;

  final double size;

  /// Two or more colours sweep along the arc. Null uses
  /// [CustomColors.progressRing].
  final List<Color>? gradientColors;

  /// Small widget riding the head of the arc. Null draws a white dot.
  final Widget? knob;

  static const double _kRadiusRatio = 0.4482;
  static const double _kStrokeRatio = 0.1035;
  static const double _kDiscRatio = 0.6519;
  static const double _kInnerDiscRatio = 0.507;
  static const double _kKnobRatio = 0.1571;
  static const double _kStartAngle = math.pi * 0.75;
  static const double _kSweepAngle = math.pi * 1.5;

  @override
  State<GaugeMeter> createState() => _GaugeMeterState();
}

class _GaugeMeterState extends State<GaugeMeter> {
  late double _displayFraction = widget.fraction;

  @override
  void didUpdateWidget(covariant GaugeMeter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fraction != widget.fraction) {
      setState(() => _displayFraction = oldWidget.fraction);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final double size = widget.size;
    final double disc = size * GaugeMeter._kDiscRatio;
    final double innerDisc = size * GaugeMeter._kInnerDiscRatio;
    final double knobSize = size * GaugeMeter._kKnobRatio;

    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(
          begin: reduceMotion ? widget.fraction : _displayFraction,
          end: widget.fraction,
        ),
        duration: Duration(milliseconds: reduceMotion ? 0 : 700),
        curve: Curves.easeOutCubic,
        builder: (BuildContext context, double value, Widget? child) {
          return CustomPaint(
            painter: _GaugePainter(
              fraction: value,
              strokeWidth: size * GaugeMeter._kStrokeRatio,
              radiusRatio: GaugeMeter._kRadiusRatio,
              gradientColors:
                  widget.gradientColors ?? CustomColors.progressRing,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: disc,
                  height: disc,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CustomColors.white.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: innerDisc,
                    height: innerDisc,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: CustomColors.white.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: child,
                  ),
                ),
                _GaugeKnob(
                  fraction: value,
                  size: knobSize,
                  radius: size * GaugeMeter._kRadiusRatio,
                  child: widget.knob,
                ),
              ],
            ),
          );
        },
        child: Text(
          widget.centerLabel,
          style: const TextStyle(
            color: CustomColors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _GaugeKnob extends StatelessWidget {
  const _GaugeKnob({
    required this.fraction,
    required this.size,
    required this.radius,
    this.child,
  });

  final double fraction;
  final double size;
  final double radius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double angle =
        GaugeMeter._kStartAngle +
        GaugeMeter._kSweepAngle * fraction.clamp(0.0, 1.0);

    return Transform.translate(
      offset: Offset(math.cos(angle) * radius, math.sin(angle) * radius),
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColors.white,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: CustomColors.ink.withValues(alpha: 0.18),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  const _GaugePainter({
    required this.fraction,
    required this.strokeWidth,
    required this.radiusRatio,
    required this.gradientColors,
  });

  final double fraction;
  final double strokeWidth;
  final double radiusRatio;
  final List<Color> gradientColors;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect arcRect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.width * radiusRatio,
    );

    canvas.drawArc(
      arcRect,
      GaugeMeter._kStartAngle,
      GaugeMeter._kSweepAngle,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..color = CustomColors.white.withValues(alpha: 0.2),
    );

    final double clamped = fraction.clamp(0.0, 1.0);
    if (clamped <= 0) return;

    canvas.drawArc(
      arcRect,
      GaugeMeter._kStartAngle,
      GaugeMeter._kSweepAngle * clamped,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round
        ..shader = LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: gradientColors,
        ).createShader(Offset.zero & size),
    );
  }

  @override
  bool shouldRepaint(covariant _GaugePainter old) =>
      old.fraction != fraction ||
      old.strokeWidth != strokeWidth ||
      old.radiusRatio != radiusRatio ||
      !listEquals(old.gradientColors, gradientColors);
}
''';
}
