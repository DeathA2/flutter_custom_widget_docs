import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/shake_container.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/shake_container.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';

import '../../preview/preview_screen.dart';

final docoumentation = ShakeContainerDocWidget();

final shakeContainer = ElementPreview(
  document: docoumentation,
  previews: [..._renderShakeContainerPreview()],
);

List<WidgetPreview> _renderShakeContainerPreview() {
  return renderPreview(
    title: 'Shake Container',
    dependencies: docoumentation.dependencies,
    description:
        'You want more attention when something wrong ? Shake Container will help you emphasize your mistake anytime when you confirm wrong filler',
    widgetCode: '''
import 'dart:math';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

abstract class AnimationControllerState<T extends StatefulWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  AnimationControllerState(this.animationDuration);
  final Duration animationDuration;
  late final animationController =
      AnimationController(vsync: this, duration: animationDuration);
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

@docWidget
class ShakeContainer extends StatefulWidget {
  const ShakeContainer({
    Key? key,
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  }) : super(key: key);
  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final Duration shakeDuration;
  @override
  ShakeContainerState createState() => ShakeContainerState(shakeDuration);
}

class ShakeContainerState extends AnimationControllerState<ShakeContainer> {
  ShakeContainerState(Duration duration) : super(duration);
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
        final sineValue =
            sin(widget.shakeCount * 2 * pi * animationController.value);
        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}

''',
    code: '''
Builder(builder: (context) {
  final shakeKey = GlobalKey<ShakeContainerState>();
  return Column(
    children: [
      FilledButtonApp(
        label: "Click here to shake",
        onPressed: () {
          shakeKey.currentState?.shake();
        },
      ),
      ShakeContainer(
        key: shakeKey,
        child: Container(
          height: 40,
          width: 40,
          color: ColorsApp.redGradient,
        ),
        shakeDuration: const Duration(milliseconds: 600),
        shakeCount: 3,
        shakeOffset: 10,
      ),
    ],
  );
});''',
    widget: _renderShakeContainer(),
  );
}

Widget _renderShakeContainer() {
  return Builder(
    builder: (context) {
      final shakeKey = GlobalKey<ShakeContainerState>();
      return Column(
        children: [
          FilledButtonApp(
            label: "Click here to shake",
            onPressed: () {
              shakeKey.currentState?.shake();
            },
          ),
          ShakeContainer(
            key: shakeKey,
            shakeDuration: const Duration(milliseconds: 600),
            shakeCount: 3,
            shakeOffset: 10,
            child: Container(
              height: 40,
              width: 40,
              color: ColorsApp.redGradient,
            ),
          ),
        ],
      );
    },
  );
}
