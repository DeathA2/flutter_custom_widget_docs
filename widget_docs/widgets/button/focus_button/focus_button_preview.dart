import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/focus_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/focus_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = FocusButtonDocWidget();

final focusButtonPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultButtonPreview],
);

//Default
final _defaultButtonPreview = renderPreview(
  dependencies: documentation.dependencies,
  widgetCode: documentation.source,
  title: "I. Default Button",
  description: "Highlight button when selected",
  code: '''
  FocusButton(
    isFocus: true,
    label: "Button",
    onPressed: () {
    },
  )
  ''',
  widget: DeviceFrameSwitcher(
    child: Row(
      children: [
        FocusButton(isFocus: true, label: "Focus", onPressed: () {}),
        Container(width: 10),
        FocusButton(isFocus: false, label: "Unfocus", onPressed: () {}),
      ],
    ),
  ),
);
