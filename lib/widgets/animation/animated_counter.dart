import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Number that counts smoothly from the previous value to the new one.
@docWidget
class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({
    required this.value,
    required this.formatter,
    this.style,
    this.duration = const Duration(milliseconds: 520),
    super.key,
  });

  final double value;

  /// Formats the value into a string. Passed in so the widget stays unaware of
  /// locale and currency.
  final String Function(double value) formatter;

  final TextStyle? style;
  final Duration duration;

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  late double _displayValue = widget.value;

  @override
  void didUpdateWidget(covariant AnimatedCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      setState(() => _displayValue = oldWidget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return TweenAnimationBuilder<double>(
      key: ValueKey<double>(widget.value),
      tween: Tween<double>(
        begin: reduceMotion ? widget.value : _displayValue,
        end: widget.value,
      ),
      duration: reduceMotion ? Duration.zero : widget.duration,
      curve: Curves.easeOutCubic,
      builder: (BuildContext context, double value, Widget? child) =>
          Text(widget.formatter(value), style: widget.style),
    );
  }
}
