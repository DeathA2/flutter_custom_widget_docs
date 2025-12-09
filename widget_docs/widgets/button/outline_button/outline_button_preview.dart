import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/outline_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/outline_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = OutlinedButtonAppDocWidget();

final outlineButtonPreview = ElementPreview(
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
  description: "Button with icon and border",
  code: '''
    OutlinedButtonApp(
        label: 'Outlined Button App',
        onPressed: () {
          print("onClick");
        },
      )
    ''',
  widget: DeviceFrameSwitcher(
    child: OutlinedButtonApp(
      label: 'Outlined Button App',
      onPressed: () {
        print("onClick");
      },
    ),
  ),
);

//Custom
final _customButtonPreview = renderPreview(
  title: "II. Custom Button",
  dependencies: [],
  widgetCode: "",
  description: "Change border color, border width, text color,...",
  code: '''
    OutlinedButtonApp(
        label: 'Custom Outline Button',
        onPressed: () {
          print("onClick");
        },
        colorText: Colors.amber,
        borderWidth: 2,
        borderColor: Colors.blue,
        paddingButton: const EdgeInsets.all(16),
      )
    )
    ''',
  widget: DeviceFrameSwitcher(
    child: OutlinedButtonApp(
      label: 'Custom Outline Button',
      onPressed: () {
        print("onClick");
      },
      colorText: Colors.amber,
      borderWidth: 2,
      borderColor: Colors.blue,
      paddingButton: const EdgeInsets.all(16),
    ),
  ),
);

//Loading
final _loadingButtonPreview = renderPreview(
  title: "III. Loading Button",
  dependencies: [],
  widgetCode: documentation.source,
  description: "Button when loading",
  code: '''
    OutlinedButtonApp(
        label: 'Loading Button App',
        onPressed: () {
          print("onClick");
        },
        isLoading: true,
      ),
    )
    ''',
  widget: DeviceFrameSwitcher(
    child: OutlinedButtonApp(
      label: 'Loading Button App',
      onPressed: () {
        print("onClick");
      },
      isLoading: true,
    ),
  ),
);
