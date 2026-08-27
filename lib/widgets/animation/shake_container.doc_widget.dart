// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ShakeContainerDocWidget implements Documentation {
  @override
  String get name => 'ShakeContainer';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
    PropertyDoc(
      name: 'child',
      isRequired: true,
      isNamed: true,
      type: 'Widget',
      description:
          'The child widget that will be wrapped and animated with a shake effect.',
    ),
    PropertyDoc(
      name: 'shakeOffset',
      isRequired: true,
      isNamed: true,
      type: 'double',
      description:
          'The maximum horizontal offset (in pixels) for the shake amplitude.',
    ),
    PropertyDoc(
      name: 'shakeCount',
      isRequired: false,
      isNamed: true,
      type: 'int',
      description: 'Number of shake oscillations in one animation cycle.',
      defaultValue: '3',
    ),
    PropertyDoc(
      name: 'shakeDuration',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      description: 'The total duration of the shake animation.',
      defaultValue: 'const Duration(milliseconds: 400)',
    ),
    PropertyDoc(
      name: 'shakeTrigger',
      isRequired: false,
      isNamed: true,
      type: 'Object?',
      description:
          'Changing this value shakes, including on the first build. Usually the error\n message. Null never shakes on its own — only [ShakeContainerState.shake] does.',
    ),
    PropertyDoc(
      name: 'decay',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Tapers the amplitude to 0 over the animation, so the shake rests exactly\n where it started. Off keeps every swing at full amplitude.',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'respectReducedMotion',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description: 'Stay still when the OS has "reduce motion" turned on.',
      defaultValue: 'true',
    ),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];

  @override
  String get source => '''import 'dart:math';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T>
    with SingleTickerProviderStateMixin {
  /// Subclasses must provide the animation duration via the [animationDuration] getter.
  Duration get animationDuration;

  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

/// Shakes [child] horizontally — for error states, or to pull the eye to a change.
@docWidget
class ShakeContainer extends StatefulWidget {
  const ShakeContainer({
    super.key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
    this.shakeTrigger,
    this.decay = false,
    this.respectReducedMotion = true,
  });

  /// The child widget that will be wrapped and animated with a shake effect.
  final Widget child;

  /// The maximum horizontal offset (in pixels) for the shake amplitude.
  final double shakeOffset;

  /// Number of shake oscillations in one animation cycle.
  final int shakeCount;

  /// The total duration of the shake animation.
  final Duration shakeDuration;

  /// Changing this value shakes, including on the first build. Usually the error
  /// message. Null never shakes on its own — only [ShakeContainerState.shake] does.
  final Object? shakeTrigger;

  /// Tapers the amplitude to 0 over the animation, so the shake rests exactly
  /// where it started. Off keeps every swing at full amplitude.
  final bool decay;

  /// Stay still when the OS has "reduce motion" turned on.
  final bool respectReducedMotion;

  @override
  ShakeContainerState createState() => ShakeContainerState();
}

class ShakeContainerState extends AnimationControllerState<ShakeContainer> {
  @override
  Duration get animationDuration => widget.shakeDuration;

  ShakeContainerState();

  bool _startedOnce = false;

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_startedOnce) return;
    _startedOnce = true;
    if (widget.shakeTrigger != null) shake();
  }

  @override
  void didUpdateWidget(covariant ShakeContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shakeTrigger != oldWidget.shakeTrigger &&
        widget.shakeTrigger != null) {
      shake();
    }
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shake() {
    if (widget.respectReducedMotion &&
        MediaQuery.disableAnimationsOf(context)) {
      return;
    }
    animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: widget.child,
      builder: (context, child) {
        final sineValue = sin(
          widget.shakeCount * 2 * pi * animationController.value,
        );
        final decay = widget.decay ? 1 - animationController.value : 1.0;
        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset * decay, 0),
          child: child,
        );
      },
    );
  }
}
''';
}
