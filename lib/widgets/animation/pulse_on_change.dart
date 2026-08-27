import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Pulses once on the `false -> true` edge of [active].
@docWidget
class PulseOnChange extends StatefulWidget {
  const PulseOnChange({
    required this.active,
    required this.child,
    this.peak = 1.06,
    this.duration = const Duration(milliseconds: 900),
    super.key,
  });

  final bool active;
  final Widget child;
  final double peak;
  final Duration duration;

  @override
  State<PulseOnChange> createState() => _PulseOnChangeState();
}

class _PulseOnChangeState extends State<PulseOnChange>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  /// Swells then settles, so both ends of the controller rest at 1.0. A plain
  /// `Tween(begin: 1, end: 1.06)` would leave the widget permanently enlarged.
  late final Animation<double> _scale =
      TweenSequence<double>(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1,
            end: widget.peak,
          ).chain(CurveTween(curve: Curves.easeOutBack)),
          weight: 35,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: widget.peak,
            end: 1,
          ).chain(CurveTween(curve: Curves.elasticOut)),
          weight: 65,
        ),
      ]).animate(_pulse);

  @override
  void didUpdateWidget(covariant PulseOnChange oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active &&
        !oldWidget.active &&
        !MediaQuery.disableAnimationsOf(context)) {
      _pulse.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (BuildContext context, Widget? child) =>
          Transform.scale(scale: _scale.value, child: child),
      child: widget.child,
    );
  }
}
