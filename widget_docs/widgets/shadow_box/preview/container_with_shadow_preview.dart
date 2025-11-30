import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/gen/assets.gen.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
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
      child: Stack(
        children: [
          Image.asset(ImagesApp.sleepScheduleCard),
          Container(
            margin: const EdgeInsets.only(top: MarginApp.m60),
            padding: const EdgeInsets.only(left: PaddingApp.p12),
            child: Text(
              StringsApp.sleepSchedule,
              style: TextStylesApp.bold(
                color: ColorsApp.white,
                fontSize: FontSizeApp.s16,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: MarginApp.m100),
            decoration: BoxDecoration(
              border: Border.all(
                color: ColorsApp.bgLight,
              ),
              borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
              color: ColorsApp.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: PaddingApp.p12),
                  child: Text(
                    StringsApp.biocareCanScheduleAndRemind,
                    style: TextStylesApp.regular(
                      color: ColorsApp.greyTertiary,
                      fontSize: FontSizeApp.s14,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: PaddingApp.p16),
                  child: FilledButtonApp(
                    label: StringsApp.getStarted,
                    color: ColorsApp.tealPrimary,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
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
        child: Stack(
          children: [
            Image.asset(Assets.images.bloodPressure7Factors.path),
            Container(
              margin: const EdgeInsets.only(top: MarginApp.m60),
              padding: const EdgeInsets.only(left: PaddingApp.p12),
              child: Text(
                "StringsApp.sleepSchedule",
                style: TextStylesApp.bold(
                  color: ColorsApp.white,
                  fontSize: FontSizeApp.s16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: MarginApp.m100),
              decoration: BoxDecoration(
                border: Border.all(color: ColorsApp.bgLight),
                borderRadius: BorderRadius.circular(BorderRadiusApp.r8),
                color: ColorsApp.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: PaddingApp.p12),
                    child: Text(
                      "StringsApp.biocareCanScheduleAndRemind",
                      style: TextStylesApp.regular(
                        color: ColorsApp.greyTertiary,
                        fontSize: FontSizeApp.s14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
