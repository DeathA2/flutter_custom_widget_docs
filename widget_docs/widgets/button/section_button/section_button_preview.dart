import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/rsc/images/image_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/section_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/section_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = SectionButtonDocWidget();

final sectionButtonPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultButtonPreview],
);

//Default
final _defaultButtonPreview = renderPreview(
  title: "I. Default Button",
  dependencies: documentation.dependencies,
  widgetCode: documentation.source,
  description: "Button with label and icons in the right and left",
  code: '''
      SectionButton(
        label: 'Section Button App',
        onPressed: () {
          print("onClick");
        },
        leftIcon: ImagesApp.icMedicine,
        rightIcon: ImagesApp.icCaret,
        bgColor: ColorsApp.greyDivider,
      )
  ''',
  widget: DeviceFrameSwitcher(
    child: SectionButton(
      label: 'Section Button App',
      onPressed: () {
        print("onClick");
      },
      leftIcon: ImagesApp.icCopy,
      rightIcon: ImagesApp.icSnackbarSuccess,
    ),
  ),
);
