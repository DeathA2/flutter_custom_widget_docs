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
  widgetCode: docoumentation.source,
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
