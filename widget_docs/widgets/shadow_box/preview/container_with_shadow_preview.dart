import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/gen/assets.gen.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/shadow_box/container_with_shadow.dart';
import 'package:flutter_custom_widget_docs/widgets/shadow_box/container_with_shadow.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = ContainerWithShadowDocWidget();

final containerWithShadowPreview = ElementPreview(
  document: documentation,
  previews: [..._containerWithShadowPreview],
);

final _containerWithShadowPreview = renderPreview(
  title: "Container With Shadow",
  description:
      "A container with shadow around, it can be changed color and shadow offset",
  dependencies: documentation.dependencies,
  code: '''
ContainerWithShadow(
    child: Container(
      padding: const EdgeInsets.all(PaddingApp.p12),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.bgLight1,
        ),
        borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
        color: ColorsApp.white,
      ),
      child: Image.asset(ImagesApp.sleepScheduleCard),
    ),
  ),
    ''',
  widget: DeviceFrameSwitcher(
    child: ContainerWithShadow(
      shadowColor: ColorsApp.black,
      child: Container(
        padding: const EdgeInsets.all(PaddingApp.p12),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsApp.bgLight1),
          borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
          color: ColorsApp.white,
        ),
        child: Image.asset(Assets.images.bloodPressure7Factors.path),
      ),
    ),
  ),
  widgetCode: documentation.source,
);
