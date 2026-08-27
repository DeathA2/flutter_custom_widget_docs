// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class EvolutionVisualDocWidget implements Documentation {
  @override
  String get name => 'EvolutionVisual';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'from',
      isRequired: true,
      isNamed: true,
      type: 'String',
      description: 'Glyph of the current thing.',
    ),
    PropertyDoc(
      name: 'to',
      isRequired: true,
      isNamed: true,
      type: 'String',
      description: 'Glyph of what it just became.',
    ),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '180: 180.0',
    ),
    PropertyDoc(
      name: 'rayColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description:
          'Colour of the burst that covers the swap. Null uses gold to orange.',
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
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Default ray colours: gold to orange.
const List<Color> _kDefaultRayColors = <Color>[
  CustomColors.gold,
  CustomColors.reward,
];

/// Hand-off animation: A shakes, shrinks away, a burst of rays covers the swap,
/// then B pops in.
@docWidget
class EvolutionVisual extends StatefulWidget {
  const EvolutionVisual({
    required this.from,
    required this.to,
    this.size = 180,
    this.rayColors,
    super.key,
  });

  /// Glyph of the current thing.
  final String from;

  /// Glyph of what it just became.
  final String to;

  final double size;

  /// Colour of the burst that covers the swap. Null uses gold to orange.
  final List<Color>? rayColors;

  /// How long the whole hand-off runs. The overlay hosting it must stay at
  /// least this long, or the animation never appears to finish.
  static const Duration duration = Duration(milliseconds: 2000);

  @override
  State<EvolutionVisual> createState() => _EvolutionVisualState();
}

class _EvolutionVisualState extends State<EvolutionVisual>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: EvolutionVisual.duration,
  );

  bool _started = false;

  late final Animation<double> _wobble = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.00, 0.34, curve: Curves.easeInOut),
  );
  late final Animation<double> _exit = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.30, 0.50, curve: Curves.easeIn),
  );
  late final Animation<double> _burst = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.38, 0.72, curve: Curves.easeOutCubic),
  );
  late final Animation<double> _enter = CurvedAnimation(
    parent: _controller,
    curve: const Interval(0.46, 1.00, curve: Curves.elasticOut),
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double glyphSize = widget.size * 0.44;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            alignment: Alignment.center,
            children: <Widget>[
              if (_burst.value > 0 && _burst.value < 1)
                CustomPaint(
                  size: Size.square(widget.size),
                  painter: _BurstPainter(
                    progress: _burst.value,
                    colors: widget.rayColors ?? _kDefaultRayColors,
                  ),
                ),

              if (_exit.value < 1)
                Opacity(
                  opacity: 1 - _exit.value,
                  child: Transform.rotate(
                    angle:
                        math.sin(_wobble.value * math.pi * 8) *
                        0.22 *
                        _wobble.value,
                    child: Transform.scale(
                      scale: 1 - _exit.value * 0.55,
                      child: Text(
                        widget.from,
                        style: TextStyle(fontSize: glyphSize),
                      ),
                    ),
                  ),
                ),

              if (_enter.value > 0)
                Opacity(
                  opacity: _enter.value.clamp(0.0, 1.0),
                  child: Transform.scale(
                    scale: (_enter.value * 1.05).clamp(0.0, 1.2),
                    child: Text(
                      widget.to,
                      style: TextStyle(fontSize: glyphSize * 1.16),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

/// Twelve rays flying out and fading — the burst that hides the swap.
class _BurstPainter extends CustomPainter {
  const _BurstPainter({required this.progress, required this.colors});

  final double progress;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset centre = size.center(Offset.zero);
    final double maxRadius = size.width / 2;
    final double inner = maxRadius * (0.18 + 0.42 * progress);
    final double outer = inner + maxRadius * 0.26 * (1 - progress * 0.5);

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5 * (1 - progress)
      ..color = Color.lerp(
        colors.first,
        colors.length > 1 ? colors[1] : colors.first,
        progress,
      )!.withValues(alpha: (1 - progress).clamp(0.0, 1.0));

    const int rays = 12;
    for (int i = 0; i < rays; i++) {
      final double angle = (i / rays) * math.pi * 2 + progress * 0.4;
      final double dx = math.cos(angle);
      final double dy = math.sin(angle);
      canvas.drawLine(
        centre + Offset(dx * inner, dy * inner),
        centre + Offset(dx * outer, dy * outer),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BurstPainter old) => old.progress != progress;
}
''';
}
