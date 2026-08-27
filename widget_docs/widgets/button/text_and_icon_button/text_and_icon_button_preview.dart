import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/images/image_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/text_and_icon_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/text_and_icon_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = TextAndIconButtonDocWidget();

final textAndIconButtonPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultButtonPreview, ..._customButtonPreview],
);

//Default
final _defaultButtonPreview = renderPreview(
  title: "I. Default Button",
  dependencies: documentation.dependencies,
  widgetCode: "",
  description: "Button with text and icon",
  code: '''
    TextAndIconButton(
        text: 'Text And Icon Button App',
        onPressed: () {
        },
        leftIcon: ImagesApp.icAddNote,
        leftIconColor: ColorsApp.blueMainChart,
        isWrapContent: true,
      )
    ''',
  widget: DeviceFrameSwitcher(
    child: TextAndIconButton(
      text: 'Default with left icon',
      onPressed: () {},
      leftIcon: ImagesApp.icCopy,
      leftIconColor: ColorsApp.blueMainChart,
      isWrapContent: true,
    ),
  ),
);

//Custom
final _customButtonPreview = renderPreview(
  title: "I. Default Button",
  dependencies: [],
  widgetCode: documentation.source,
  description:
      "You can change text color/text size, border color/border width/border radius, icon color/icon size",
  code: '''
      TextAndIconButton(
          text: 'Text And Icon Button App',
          textColor: ColorsApp.bluePrimary,
          onPressed: () {
          },
          leftIcon: ImagesApp.icAddNote,
          leftIconColor: ColorsApp.error,
          borderColor: ColorsApp.attention,
          borderWidth: 2,
          borderRadius: 20,
          isWrapContent: true,
        )
      ''',
  widget: DeviceFrameSwitcher(
    child: TextAndIconButton(
      text: 'Text And Icon Button App',
      textColor: ColorsApp.bluePrimary,
      onPressed: () {},
      leftIcon: ImagesApp.icCopy,
      leftIconColor: ColorsApp.error,
      borderColor: ColorsApp.attention,
      borderWidth: 2,
      borderRadius: 20,
      isWrapContent: true,
    ),
  ),
);
