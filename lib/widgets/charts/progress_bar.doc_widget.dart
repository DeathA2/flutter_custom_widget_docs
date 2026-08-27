// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ProgressBarDocWidget implements Documentation {
  @override
  String get name => 'ProgressBar';

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
      name: 'identity',
      isRequired: true,
      isNamed: true,
      type: 'Object',
      description: 'What this bar is about — see the class docs.',
    ),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
    ),
    PropertyDoc(
      name: 'trackColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral200',
    ),
    PropertyDoc(
      name: 'minHeight',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '12: 12.0',
    ),
    PropertyDoc(
      name: 'gradientColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description:
          'Two or more colours fills with a gradient. Null keeps the flat [color].',
    ),
    PropertyDoc(
      name: 'shimmer',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Light band sweeping across the filled part, looping forever.',
      defaultValue: 'false',
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

/// Progress bar that animates only when the number actually changes.
@docWidget
class ProgressBar extends StatefulWidget {
  const ProgressBar({
    required this.fraction,
    required this.identity,
    this.color = CustomColors.brand,
    this.trackColor = CustomColors.neutral200,
    this.minHeight = 12,
    this.gradientColors,
    this.shimmer = false,
    super.key,
  });

  final double fraction;

  /// What this bar is about — see the class docs.
  final Object identity;

  final Color color;
  final Color trackColor;
  final double minHeight;

  /// Two or more colours fills with a gradient. Null keeps the flat [color].
  final List<Color>? gradientColors;

  /// Light band sweeping across the filled part, looping forever.
  final bool shimmer;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  late double _displayFraction;

  @override
  void initState() {
    super.initState();
    _displayFraction = widget.fraction;
  }

  @override
  void didUpdateWidget(covariant ProgressBar oldWidget) {
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

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.minHeight),
      child: TweenAnimationBuilder<double>(
        key: ValueKey<String>('\${widget.identity}-\${widget.fraction}'),
        tween: Tween<double>(
          begin: reduceMotion ? widget.fraction : _displayFraction,
          end: widget.fraction,
        ),
        duration: Duration(milliseconds: reduceMotion ? 0 : 600),
        curve: Curves.easeOutCubic,
        builder: (BuildContext context, double value, Widget? child) =>
            _bar(value),
      ),
    );
  }

  Widget _bar(double value) {
    final List<Color>? gradient = widget.gradientColors;

    if ((gradient == null || gradient.length < 2) && !widget.shimmer) {
      return LinearProgressIndicator(
        value: value.clamp(0.0, 1.0),
        minHeight: widget.minHeight,
        backgroundColor: widget.trackColor,
        color: widget.color,
      );
    }

    return _GradientBar(
      value: value,
      minHeight: widget.minHeight,
      trackColor: widget.trackColor,
      colors: gradient ?? <Color>[widget.color, widget.color],
      shimmer: widget.shimmer,
    );
  }
}

/// The gradient fill, optionally with the sweeping highlight.
class _GradientBar extends StatefulWidget {
  const _GradientBar({
    required this.value,
    required this.minHeight,
    required this.trackColor,
    required this.colors,
    required this.shimmer,
  });

  final double value;
  final double minHeight;
  final Color trackColor;
  final List<Color> colors;
  final bool shimmer;

  @override
  State<_GradientBar> createState() => _GradientBarState();
}

class _GradientBarState extends State<_GradientBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _sweep;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (widget.shimmer && !MediaQuery.disableAnimationsOf(context)) {
      (_sweep ??= AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 2200),
      )).repeat();
    }
  }

  @override
  void dispose() {
    _sweep?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController? sweep = _sweep;
    final bool band = widget.shimmer && (sweep?.isAnimating ?? false);

    return ExcludeSemantics(
      child: SizedBox(
        height: widget.minHeight,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double fillWidth =
                constraints.maxWidth * widget.value.clamp(0.0, 1.0);

            return Stack(
              children: <Widget>[
                Positioned.fill(child: ColoredBox(color: widget.trackColor)),
                SizedBox(
                  width: fillWidth,
                  height: widget.minHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: widget.colors),
                    ),
                    child: band
                        ? ClipRect(child: _band(sweep!, fillWidth))
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _band(AnimationController sweep, double fillWidth) {
    return AnimatedBuilder(
      animation: sweep,
      builder: (BuildContext context, Widget? child) {
        final double dx = (sweep.value * 2 - 1) * fillWidth;
        return Transform.translate(
          offset: Offset(dx, 0),
          child: Container(
            width: fillWidth * 0.45,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  CustomColors.white.withValues(alpha: 0),
                  CustomColors.white.withValues(alpha: 0.55),
                  CustomColors.white.withValues(alpha: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
''';
}
