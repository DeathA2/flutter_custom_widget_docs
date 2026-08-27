import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/animated_counter.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/animated_counter.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = AnimatedCounterDocWidget();

final animatedCounterPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Animated Counter",
  description:
      "A number that rolls smoothly from the old value to the new one. It seeds the start from the value it *last displayed*, not from zero: counting up from zero on every mount reads as \"you just received all of this\". Formatting is passed in, so the widget never needs to know about locale or currency.",
  dependencies: _documentation.dependencies,
  code: r'''
AnimatedCounter(
  value: points,
  formatter: (v) => v.round().toString(),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<double>(
      initial: 1250,
      builder: (BuildContext context, double value, ValueChanged<double> set) =>
          DemoSurface(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedCounter(
                  value: value,
                  formatter: (double v) => v.round().toString(),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    color: CustomColors.brand,
                  ),
                ),
                const SizedBox(height: 24),
                OutlinedButton(
                  onPressed: () => set(value + 375),
                  child: const Text('Add 375 points'),
                ),
              ],
            ),
          ),
    ),
  ),
  widgetCode: r'''
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
  ''',
);
