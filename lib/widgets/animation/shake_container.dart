import 'dart:math';
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

@docWidget
class ShakeContainer extends StatefulWidget {
  const ShakeContainer({
    super.key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  });

  /// The child widget that will be wrapped and animated with a shake effect.
  final Widget child;

  /// The maximum horizontal offset (in pixels) for the shake amplitude.
  final double shakeOffset;

  /// Number of shake oscillations in one animation cycle.
  final int shakeCount;

  /// The total duration of the shake animation.
  final Duration shakeDuration;
  @override
  ShakeContainerState createState() => ShakeContainerState();
}

class ShakeContainerState extends AnimationControllerState<ShakeContainer> {
  @override
  Duration get animationDuration => widget.shakeDuration;

  ShakeContainerState();

  @override
  void initState() {
    super.initState();
    animationController.addStatusListener(_updateStatus);
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
    animationController.forward();
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
        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
