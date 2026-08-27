// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ConfettiDocWidget implements Documentation {
  @override
  String get name => 'Confetti';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'controller',
      isRequired: true,
      isNamed: true,
      type: 'ConfettiController',
    ),
    PropertyDoc(
      name: 'alignment',
      isRequired: false,
      isNamed: true,
      type: 'Alignment',
      defaultValue: 'Alignment.topCenter',
    ),
    PropertyDoc(
      name: 'particleCount',
      isRequired: false,
      isNamed: true,
      type: 'int',
      defaultValue: '24',
    ),
    PropertyDoc(
      name: 'colors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description: 'Flake palette. Null uses [CustomColors.confetti].',
    ),
    PropertyDoc(
      name: 'pathBuilder',
      isRequired: false,
      isNamed: true,
      type: 'Path Function(Size)',
      description: 'Shape of one flake, given that flake\'s size.',
      defaultValue: 'ParticlePaths.star: Path star(Size size)',
    ),
    PropertyDoc(
      name: 'minSize',
      isRequired: false,
      isNamed: true,
      type: 'Size',
      defaultValue: 'const Size(8, 8)',
    ),
    PropertyDoc(
      name: 'maxSize',
      isRequired: false,
      isNamed: true,
      type: 'Size',
      defaultValue: 'const Size(14, 16)',
    ),
    PropertyDoc(
      name: 'gravity',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description:
          'Gravity, as a fraction of screen height per second squared.',
      defaultValue: '0.22',
    ),
    PropertyDoc(
      name: 'blastDirection',
      isRequired: false,
      isNamed: true,
      type: 'double?',
      description:
          'Blast direction in radians (0 is right, -pi/2 is up). Null bursts evenly\n in every direction.',
    ),
    PropertyDoc(
      name: 'spread',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description:
          'Width of the blast fan in radians. Ignored when [blastDirection] is null.',
      defaultValue: 'math.pi * 2: 6.283185307179586',
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

/// Ready-made confetti particle shapes.
abstract final class ParticlePaths {
  /// Five-pointed star — the shape of a "well done" moment.
  static Path star(Size size) {
    const int points = 5;
    final double outer = size.width / 2;
    final double inner = outer / 2.5;
    final Path path = Path();
    const double step = math.pi / points;

    for (int i = 0; i < points * 2; i++) {
      final double radius = i.isEven ? outer : inner;
      final double angle = i * step - math.pi / 2;
      final double x = outer + radius * math.cos(angle);
      final double y = outer + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    return path..close();
  }

  /// Curved streamer — what an opening gift box should scatter.
  static Path streamer(Size size) {
    final double h = size.height;
    final double band = size.width * 0.5;
    final double sway = size.width - band;

    return Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(sway, h * 0.34, sway * 0.2, h * 0.66)
      ..quadraticBezierTo(-sway * 0.5, h * 0.87, sway * 0.45, h)
      ..lineTo(sway * 0.45 + band, h)
      ..quadraticBezierTo(
        -sway * 0.5 + band,
        h * 0.87,
        sway * 0.2 + band,
        h * 0.66,
      )
      ..quadraticBezierTo(sway + band, h * 0.34, band, 0)
      ..close();
  }

  /// Rounded rectangle — the classic confetti flake.
  static Path rectangle(Size size) => Path()
    ..addRRect(
      RRect.fromRectAndRadius(
        Offset.zero & size,
        Radius.circular(size.width * 0.2),
      ),
    );
}

/// Drives a [Confetti]. Call [play] to fire.
class ConfettiController extends ChangeNotifier {
  ConfettiController({this.duration = const Duration(milliseconds: 2200)});

  final Duration duration;
  int _generation = 0;

  /// Bumps on every shot. The widget uses it as the key for a fresh particle set.
  int get generation => _generation;

  void play() {
    _generation++;
    notifyListeners();
  }
}

/// Hand-rolled confetti particle system, in place of the `confetti` package.
@docWidget
class Confetti extends StatefulWidget {
  const Confetti({
    required this.controller,
    this.alignment = Alignment.topCenter,
    this.particleCount = 24,
    this.colors,
    this.pathBuilder = ParticlePaths.star,
    this.minSize = const Size(8, 8),
    this.maxSize = const Size(14, 16),
    this.gravity = 0.22,
    this.blastDirection,
    this.spread = math.pi * 2,
    super.key,
  });

  final ConfettiController controller;
  final Alignment alignment;
  final int particleCount;

  /// Flake palette. Null uses [CustomColors.confetti].
  final List<Color>? colors;

  /// Shape of one flake, given that flake's size.
  final Path Function(Size size) pathBuilder;

  final Size minSize;
  final Size maxSize;

  /// Gravity, as a fraction of screen height per second squared.
  final double gravity;

  /// Blast direction in radians (0 is right, -pi/2 is up). Null bursts evenly
  /// in every direction.
  final double? blastDirection;

  /// Width of the blast fan in radians. Ignored when [blastDirection] is null.
  final double spread;

  @override
  State<Confetti> createState() => _ConfettiState();
}

class _ConfettiState extends State<Confetti>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  /// Seeded per shot, so one generation always yields the same particle set and
  /// a rebuild mid-flight does not teleport the flakes.
  List<_Particle> _particles = const <_Particle>[];

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.controller.duration);
    widget.controller.addListener(_onPlay);
  }

  @override
  void didUpdateWidget(covariant Confetti oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onPlay);
      widget.controller.addListener(_onPlay);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onPlay);
    _c.dispose();
    super.dispose();
  }

  void _onPlay() {
    if (!mounted) return;
    if (MediaQuery.disableAnimationsOf(context)) return;

    final math.Random rng = math.Random(widget.controller.generation * 7919);
    final List<Color> palette = widget.colors ?? CustomColors.confetti;
    setState(() {
      _particles = List<_Particle>.generate(widget.particleCount, (int i) {
        final double angle = widget.blastDirection == null
            ? rng.nextDouble() * math.pi * 2
            : widget.blastDirection! + (rng.nextDouble() - 0.5) * widget.spread;
        final double speed = 0.35 + rng.nextDouble() * 0.55;
        return _Particle(
          angle: angle,
          speed: speed,
          spin: (rng.nextDouble() - 0.5) * 8,
          flipSpeed: 2 + rng.nextDouble() * 4,
          drag: 0.86 + rng.nextDouble() * 0.1,
          delay: rng.nextDouble() * 0.18,
          color: palette[rng.nextInt(palette.length)],
          size: Size(
            widget.minSize.width +
                rng.nextDouble() *
                    (widget.maxSize.width - widget.minSize.width),
            widget.minSize.height +
                rng.nextDouble() *
                    (widget.maxSize.height - widget.minSize.height),
          ),
        );
      });
    });
    _c.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    if (_particles.isEmpty) return const SizedBox.shrink();

    return IgnorePointer(
      child: Align(
        alignment: widget.alignment,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: AnimatedBuilder(
            animation: _c,
            builder: (BuildContext context, Widget? child) {
              if (_c.isCompleted) return const SizedBox.shrink();
              return CustomPaint(
                painter: _ConfettiPainter(
                  particles: _particles,
                  progress: _c.value,
                  gravity: widget.gravity,
                  origin: widget.alignment,
                  pathBuilder: widget.pathBuilder,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Particle {
  const _Particle({
    required this.angle,
    required this.speed,
    required this.spin,
    required this.flipSpeed,
    required this.drag,
    required this.delay,
    required this.color,
    required this.size,
  });

  final double angle;
  final double speed;
  final double spin;

  /// Flip speed around the vertical axis — what makes a flake read as paper
  /// rather than a coloured dot.
  final double flipSpeed;

  final double drag;
  final double delay;
  final Color color;
  final Size size;
}

class _ConfettiPainter extends CustomPainter {
  const _ConfettiPainter({
    required this.particles,
    required this.progress,
    required this.gravity,
    required this.origin,
    required this.pathBuilder,
  });

  final List<_Particle> particles;
  final double progress;
  final double gravity;
  final Alignment origin;
  final Path Function(Size size) pathBuilder;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset start = origin.alongSize(size);
    final double reference = size.height;

    for (final _Particle p in particles) {
      final double span = 1 - p.delay;
      if (span <= 0) continue;
      final double t = ((progress - p.delay) / span).clamp(0.0, 1.0);
      if (t <= 0) continue;

      final double travelled =
          p.speed * (1 - math.pow(p.drag, t * 60)) / (1 - p.drag);
      final double dx = math.cos(p.angle) * travelled * reference * 0.02;
      final double dy =
          math.sin(p.angle) * travelled * reference * 0.02 +
          gravity * t * t * reference;

      final double opacity = t > 0.75 ? (1 - (t - 0.75) / 0.25) : 1.0;
      if (opacity <= 0) continue;

      final double flipScale = math
          .cos(t * p.flipSpeed * math.pi)
          .abs()
          .clamp(0.15, 1.0);

      canvas
        ..save()
        ..translate(start.dx + dx, start.dy + dy)
        ..rotate(p.spin * t)
        ..scale(flipScale, 1)
        ..translate(-p.size.width / 2, -p.size.height / 2)
        ..drawPath(
          pathBuilder(p.size),
          Paint()..color = p.color.withValues(alpha: opacity),
        )
        ..restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter old) =>
      old.progress != progress || old.particles != particles;
}
''';
}
