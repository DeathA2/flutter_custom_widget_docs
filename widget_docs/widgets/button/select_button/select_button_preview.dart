import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/select_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/select_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = SelectButtonDocWidget();

final selectButtonPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultButtonPreview],
);

//Default
final _defaultButtonPreview = renderPreview(
  title: "I. Default Button",
  dependencies: documentation.dependencies,
  widgetCode: documentation.source,
  description: "Button will highlight when selected",
  code: '''
    SelectButton(
        label: 'Section Button App',
        onPressed: () {
          print("onClick");
        },
        isFocus: true,
      )
    ''',
  widget: DeviceFrameSwitcher(
    child: SelectButton(
      label: 'Section Button App',
      onPressed: () {
        print("onClick");
      },
      isFocus: true,
    ),
  ),
);
