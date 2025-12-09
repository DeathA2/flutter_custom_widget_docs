import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/checkbox/square_checkbox.dart';
import 'package:flutter_custom_widget_docs/widgets/checkbox/square_checkbox.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = SquareCheckBoxDocWidget();

final squareCheckBoxPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultCheckBoxPreview, ..._customCheckBoxPreview],
);

//* Default Uncheck CheckBox
final _defaultCheckBoxPreview = renderPreview(
  title: "I. Default Uncheck CheckBox",
  dependencies: documentation.dependencies,
  widgetCode: "",
  description:
      "The default checkBox is un-fill by the blue primary color and the lable required, sublabel is optional",
  code: '''
    SquareCheckBox(
    label: "Uncheck checkBox",
    sublabel: 'sublabel',
    value: false,
    onValueChanged: (bool value) {},
  ),
    ''',
  widget: DeviceFrameSwitcher(
    child: SquareCheckBox(
      label: "Uncheck checkBox",
      sublabel: 'sublabel',
      value: false,
      onValueChanged: (bool value) {},
    ),
  ),
);

//* Checked CheckBox
final _customCheckBoxPreview = renderPreview(
  title: "II. Checked CheckBox",
  dependencies: [],
  widgetCode: documentation.source,
  description:
      "The value is true, checkBox is filled by the blue primary color and the lable required, sublabel is optional",
  code: '''
    SquareCheckBox(
    label: "Checked CheckBox",
    sublabel: 'sublabel',
    value: true,
    onValueChanged: (bool value) {},
  ),
    ''',
  widget: DeviceFrameSwitcher(
    child: SquareCheckBox(
      label: "Checked CheckBox",
      sublabel: 'sublabel',
      value: true,
      onValueChanged: (bool value) {},
    ),
  ),
);
