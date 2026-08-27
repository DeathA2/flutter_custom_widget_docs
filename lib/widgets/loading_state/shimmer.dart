import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Hand-rolled shimmer — no `shimmer` package.
@docWidget
class Shimmer extends StatefulWidget {
  const Shimmer({
    required this.child,
    this.baseColor = CustomColors.neutral200,
    this.highlightColor = CustomColors.neutral100,
    this.period = const Duration(milliseconds: 1400),
    super.key,
  });

  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration period;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  /// Nullable, and only created where it actually starts. Never
  /// `late final ... = AnimationController(vsync: this)`: a `late` field runs its
  /// initialiser on first *read*, and for a shimmer that never runs, that first
  /// read is `dispose()`.
  AnimationController? _sweep;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (!MediaQuery.disableAnimationsOf(context)) {
      (_sweep ??= AnimationController(
        vsync: this,
        duration: widget.period,
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
    if (sweep == null) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(widget.baseColor, BlendMode.srcATop),
        child: widget.child,
      );
    }

    return AnimatedBuilder(
      animation: sweep,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        final double t = sweep.value * 3 - 1;
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment(t - 1, 0),
              end: Alignment(t + 1, 0),
              colors: <Color>[
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const <double>[0.35, 0.5, 0.65],
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }
}
