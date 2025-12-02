import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final docoumentation = TouchableOpacityDocWidget();

final touchableOpacityPreview = ElementPreview(
  document: docoumentation,
  previews: [..._touchableOpacityPreview],
);

final _touchableOpacityPreview = renderPreview(
  title: "I. Touchable Opacity Widget ",
  description:
      "An container which gives its child changing opacity animation. Use this for complex UI widget - in which InkWell or others widget barely work normally",
  dependencies: docoumentation.dependencies,
  code: '''
    TouchableOpacity(
      child: Container(
        color: Colors.lightBlue,
        width: 300,
        height: 150,
        child: const Text('Complex UI Widget'),
      ),
      onTap: () {},
    ),
  ''',
  widgetCode: '''
import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({super.key, required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.5;

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: isDown ? widget.opacity : 1,
        child: widget.child,
      ),
    );
  }
}
  ''',
  widget: DeviceFrameSwitcher(
    child: TouchableOpacity(
      child: Container(
        color: Colors.lightBlue,
        alignment: Alignment.center,
        width: 300,
        height: 150,
        child: const Text('Complex UI Widget'),
      ),
      onTap: () {},
    ),
  ),
);
