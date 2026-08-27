// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class BreathingDocWidget implements Documentation {
  @override
  String get name => 'Breathing';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'enabled',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'scaleAmount',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'How much larger it grows at the peak. `0.05` means +5%.',
      defaultValue: '0.05',
    ),
    PropertyDoc(
      name: 'liftAmount',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'How many pixels it lifts at the peak. 0 scales only.',
      defaultValue: '0: 0.0',
    ),
    PropertyDoc(
      name: 'period',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      defaultValue: 'const Duration(milliseconds: 3000)',
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

/// Slow looping "breath": scales up and down, optionally lifting as well.
@docWidget
class Breathing extends StatefulWidget {
  const Breathing({
    required this.child,
    this.enabled = true,
    this.scaleAmount = 0.05,
    this.liftAmount = 0,
    this.period = const Duration(milliseconds: 3000),
    super.key,
  });

  final Widget child;
  final bool enabled;

  /// How much larger it grows at the peak. `0.05` means +5%.
  final double scaleAmount;

  /// How many pixels it lifts at the peak. 0 scales only.
  final double liftAmount;

  final Duration period;

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing>
    with SingleTickerProviderStateMixin {
  AnimationController? _breathe;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    _sync();
  }

  @override
  void didUpdateWidget(covariant Breathing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) _sync();
  }

  void _sync() {
    if (!widget.enabled || MediaQuery.disableAnimationsOf(context)) {
      _breathe?.stop();
      _breathe?.value = 0;
      return;
    }
    (_breathe ??= AnimationController(
      vsync: this,
      duration: widget.period,
    )).repeat(reverse: true);
  }

  @override
  void dispose() {
    _breathe?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController? breathe = _breathe;
    if (breathe == null) return widget.child;

    return AnimatedBuilder(
      animation: breathe,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        final double t = Curves.easeInOut.transform(breathe.value);
        return Transform.translate(
          offset: Offset(0, -widget.liftAmount * t),
          child: Transform.scale(
            scale: 1 + widget.scaleAmount * t,
            child: child,
          ),
        );
      },
    );
  }
}
''';
}
