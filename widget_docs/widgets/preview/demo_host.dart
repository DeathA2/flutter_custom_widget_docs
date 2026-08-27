import 'package:flutter/material.dart';

/// Holds a piece of state for previews that need real interaction.
///
/// `renderPreview` takes a `Widget` built once at top level, so anything that
/// needs a `value` + `onChanged` round trip cannot change on its own. Wrapping
/// it here makes the preview behave like the real app.
class DemoValue<T> extends StatefulWidget {
  const DemoValue({super.key, required this.initial, required this.builder});

  final T initial;
  final Widget Function(BuildContext context, T value, ValueChanged<T> set)
  builder;

  @override
  State<DemoValue<T>> createState() => _DemoValueState<T>();
}

class _DemoValueState<T> extends State<DemoValue<T>> {
  late T _value = widget.initial;

  @override
  Widget build(BuildContext context) => widget.builder(
    context,
    _value,
    (T next) => setState(() => _value = next),
  );
}

/// White background and padding for previews that need room inside the frame.
class DemoSurface extends StatelessWidget {
  const DemoSurface({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.background = Colors.white,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      padding: padding,
      child: child,
    );
  }
}
