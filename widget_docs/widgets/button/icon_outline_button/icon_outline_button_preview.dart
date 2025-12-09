import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/images/image_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/icon_outline_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/icon_outline_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = IconOutlinedButtonDocWidget();

final iconOutlineButtonPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultButtonPreview, ..._customButtonPreview],
);

//Default
final _defaultButtonPreview = renderPreview(
  title: "I. Default Button",
  dependencies: documentation.dependencies,
  widgetCode: "",
  description: "Button with icon and border",
  code: '''
    IconOutlinedButton(
        icon: ImagesApp.icArrowBackAndroid,
        onPressed: () {
          print("onClick");
        },
      )
    ''',
  widget: DeviceFrameSwitcher(
    child: IconOutlinedButton(
      icon: ImagesApp.icSnackbarSuccess,
      onPressed: () {
        print("onClick");
      },
    ),
  ),
);

//Custom
final _customButtonPreview = renderPreview(
  title: "I. Custom Button",
  dependencies: [],
  widgetCode: documentation.source,
  description: "Change background color",
  code: '''
    IconOutlinedButton(
        icon: ImagesApp.icArrowBackAndroid,
        onPressed: () {
          print("onClick");
        },
      )
    ''',
  widget: DeviceFrameSwitcher(
    child: IconOutlinedButton(
      icon: ImagesApp.logoGithub,
      bgColor: Colors.cyan,
      onPressed: () {
        print("onClick");
      },
    ),
  ),
);
