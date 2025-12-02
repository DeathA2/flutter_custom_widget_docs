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
  widgetCode: '''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';

@docWidget
class ContainerWithShadow extends StatelessWidget {
  final Widget child;
  final Color? shadowColor;
  final Offset shadowXY;
  final double shadowB;
  final double shadowS;
  const ContainerWithShadow({
    super.key,
    required this.child,
    this.shadowColor,
    this.shadowXY = OffsetApp.o04,
    this.shadowB = BlurRadiusApp.b10,
    this.shadowS = SpreadRadiusApp.s0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? ColorsApp.boxShadow,
            offset: shadowXY,
            blurRadius: shadowB,
            spreadRadius: shadowS,
          ),
        ],
      ),
      child: child,
    );
  }
}

''',
);
