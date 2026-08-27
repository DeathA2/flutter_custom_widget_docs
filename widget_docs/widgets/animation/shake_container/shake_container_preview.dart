import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/shake_container.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/shake_container.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = ShakeContainerDocWidget();

final shakeContainerPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Shake Container",
  description:
      "Shakes its child horizontally — for error states, or to pull the eye back to something that changed. Two ways to trigger it, both supported: imperatively, by holding a `GlobalKey<ShakeContainerState>` and calling `shake()`, which suits a shake that reacts to a handler; or declaratively, by passing `shakeTrigger` and changing its value, which also fires on first build when the trigger is non-null — a shake only exists because something went wrong, and something wrong is always something that *just* happened. `decay` tapers the amplitude to zero so the widget rests exactly where it started, and it stays still when the OS has reduce-motion enabled.",
  dependencies: _documentation.dependencies,
  code: r'''
ShakeContainer(
  shakeTrigger: errorMessage,
  shakeOffset: 8,
  decay: true,
  child: myField,
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Builder(
        builder: (BuildContext context) {
          final GlobalKey<ShakeContainerState> shakeKey =
              GlobalKey<ShakeContainerState>();
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ShakeContainer(
                key: shakeKey,
                shakeDuration: const Duration(milliseconds: 600),
                shakeCount: 3,
                shakeOffset: 10,
                child: Container(
                  height: 56,
                  width: 160,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CustomColors.errorSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Wrong code'),
                ),
              ),
              const SizedBox(height: 24),
              FilledButtonApp(
                label: 'Shake it',
                variant: FilledButtonVariant.primaryCta,
                fullWidth: false,
                onPressed: () => shakeKey.currentState?.shake(),
              ),
            ],
          );
        },
      ),
    ),
  ),
  widgetCode: r'''
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
  ''',
);
