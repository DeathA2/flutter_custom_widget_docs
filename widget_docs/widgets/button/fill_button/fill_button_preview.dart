import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = FilledButtonAppDocWidget();

final fillButtonPreview = ElementPreview(
  document: documentation,
  previews: [
    ..._defaultButtonPreview,
    ..._customButtonPreview,
    ..._loadingButtonPreview,
  ],
);

//Default
final _defaultButtonPreview = renderPreview(
  title: "I. Default Button",
  dependencies: documentation.dependencies,
  widgetCode: "",
  description:
      "The default button is filled by the blue primary color and the lable required.",
  code: '''
    FilledButtonApp(
        label: "Button",
        onPressed: () {
        print("onClick");
    },)
    ''',
  widget: DeviceFrameSwitcher(
    child: FilledButtonApp(
      label: "Button",
      onPressed: () {
        print("onClick");
      },
    ),
  ),
);

//Custom color and text
final _customButtonPreview = renderPreview(
  title: "II. Custom Button",
  dependencies: [],
  widgetCode: "",
  description:
      "We can change the text color of the button or any the color of its by passing the textColor or the color as the parameters.",
  code: '''
    FilledButtonApp(
      label: "Custom Button",
      textColor: Colors.black,
      color: Colors.yellow,
      onPressed: () {
        print("onClick");
    },)
    ''',
  widget: DeviceFrameSwitcher(
    child: FilledButtonApp(
      label: "Custom Button",
      textColor: Colors.black,
      color: Colors.yellow,
      onPressed: () {
        print("onClick");
      },
    ),
  ),
);

//Custom loading button
final _loadingButtonPreview = renderPreview(
  title: "III. Loading Button",
  dependencies: [],
  widgetCode: documentation.source,
  description:
      "  We can enable or disable the loading status of the button by setting isLoading parameter.",
  code: '''
    FilledButtonApp(
      label: "Loading Button",
      textColor: Colors.black,
      color: Colors.yellow,
      isLoading: true,
      onPressed: () {
        print("onClick");
    },)
    ''',
  widget: DeviceFrameSwitcher(
    child: FilledButtonApp(
      label: "Loading Button",
      textColor: Colors.black,
      color: Colors.yellow,
      isLoading: true,
      onPressed: () {
        print("onClick");
      },
    ),
  ),
);
