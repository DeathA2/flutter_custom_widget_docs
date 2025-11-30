import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/rulers/bubble_ruler.dart';
import 'package:flutter_custom_widget_docs/widgets/rulers/bubble_ruler.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = BubbleColorBarDocWidget();

final bubbleColorBarPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultRuler],
);

// Default
final _defaultRuler = renderPreview(
  title: "I. Bubble bar",
  description: "Using for display horizontal domain chart",
  dependencies: documentation.dependencies,
  code: '''
BubbleColorBar(
    showBubble: true,
    showMarker: true,
    isCel: true,
    barType: BarType.spO2,
    value: 97,
  )
''',
  widget: DeviceFrameSwitcher(
    child: BubbleColorBar(
      showBubble: true,
      showMarker: true,
      isCel: true,
      barType: BarType.spO2,
      value: 97,
    ),
  ),
  widgetCode: '''
import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/hatch_mark.dart';
import 'package:another_xlider/models/hatch_mark_label.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_position_offset.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/gen/assets.gen.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/utils/number.dart';
import 'package:flutter_svg/svg.dart';

enum BarType { bodyTemperature, spO2 }

// Bubble Sample: https://www.figma.com/file/F4JVO6al4f2wMJ2kMoALR1/Biocare-App---In-Dev?node-id=10816%3A84743
// Color Bar Sample: https://www.figma.com/file/F4JVO6al4f2wMJ2kMoALR1/Biocare-App---In-Dev?node-id=10816%3A84698

@docWidget
class BubbleColorBar extends StatelessWidget {
  /// Current [value] of Description Bar
  final double? value;

  /// Type of this bar. Currently only support 2 types
  final BarType barType;

  /// Set this to false to hide the marker
  final bool showMarker;

  /// Set this to false to hide the bubble
  final bool? showBubble;

  /// The unit of [value]
  final String? valueUnit;

  /// Set this if [barType] is body temperature to change the unit type
  final bool? isCel;

  const BubbleColorBar({
    this.value,
    required this.barType,
    this.showMarker = true,
    this.showBubble = true,
    this.valueUnit,
    this.isCel = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<double> hatchMarkList = _chooseHatchMarkList(barType);
    List<Color> mainColorList = _chooseColorList(barType);
    List<int> widthPercent = _calculateColorWidth(barType);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        showBubble!
            ? _renderValueBubble(value, mainColorList, hatchMarkList)
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingApp.p16,
          ), // Prevent overflow hatch mark
          child: Stack(
            children: [
              _renderColorRow(mainColorList, widthPercent),
              _renderSlider(value, hatchMarkList),
            ],
          ),
        ),
      ],
    );
  }

  Widget _renderValueBubble(
    double? value,
    List<Color> mainColorList,
    List<double> hatchMarkList,
  ) {
    int colorIndex = _chooseColorIndex(barType, hatchMarkList);
    List<Color> borderColorList = _chooseBorderColorList(barType);
    return Container(
      width: SizeApp.s120,
      height: SizeApp.s120,
      margin: const EdgeInsets.only(bottom: PaddingApp.p26),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusApp.r60),
        color: mainColorList[colorIndex],
        border: Border.all(
          color: borderColorList[colorIndex],
          width: SizeApp.s4,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _formatDecimalNumber(value),
            textAlign: TextAlign.center,
            style: TextStylesApp.bold(
              color: ColorsApp.white,
              fontSize: FontSizeApp.s22,
            ),
          ),
          Text(
            valueUnit != null ? ' \$valueUnit' : '',
            style: TextStylesApp.regular(
              color: ColorsApp.white,
              fontSize: FontSizeApp.s14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderColorRow(List<Color> mainColorList, widthPercent) {
    int colorLength = mainColorList.length - 1;
    List<Widget> list = [];
    for (var i = 0; i <= colorLength; i++) {
      list.add(
        Expanded(
          flex: widthPercent[i],
          child: Container(
            height: SizeApp.s6,
            decoration: BoxDecoration(
              color: mainColorList[i],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(i == 0 ? BorderRadiusApp.r2 : 0),
                bottomLeft: Radius.circular(i == 0 ? BorderRadiusApp.r2 : 0),
                topRight: Radius.circular(
                  i == colorLength ? BorderRadiusApp.r2 : 0,
                ),
                bottomRight: Radius.circular(
                  i == colorLength ? BorderRadiusApp.r2 : 0,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Row(children: list);
  }

  Widget _renderSlider(double? value, List<double> hatchMarkList) {
    return FlutterSlider(
      disabled: true,
      min: hatchMarkList[0],
      max: hatchMarkList[hatchMarkList.length - 1],
      values: [_formatValue(value, hatchMarkList)],
      handlerWidth: 0, // this also be the horizontal padding of the slider
      handlerHeight: 15, // prevent overflow bottom when setting hatch mark
      handler: FlutterSliderHandler(opacity: 0), // hide default handler
      trackBar: const FlutterSliderTrackBar(
        inactiveTrackBar: BoxDecoration(color: Colors.transparent),
        activeTrackBar: BoxDecoration(color: Colors.transparent),
        inactiveDisabledTrackBarColor: Colors.transparent,
        activeDisabledTrackBarColor: Colors.transparent,
      ),
      tooltip: FlutterSliderTooltip(
        disabled: !showMarker,
        alwaysShowTooltip: true,
        positionOffset: FlutterSliderTooltipPositionOffset(top: -SizeApp.s12),
        custom: (_) {
          return SvgPicture.asset(Assets.svg.icDescriptionStroke);
        },
      ),
      hatchMark: FlutterSliderHatchMark(
        labels: _createHatchMark(hatchMarkList),
        labelsDistanceFromTrackBar: 5,
      ),
    );
  }

  List<FlutterSliderHatchMarkLabel> _createHatchMark(
    List<double> hatchMarkList,
  ) {
    int hatchMarkLength = hatchMarkList.length - 1;
    List<FlutterSliderHatchMarkLabel> list = [];
    for (var i = 0; i <= hatchMarkLength; i++) {
      list.add(
        FlutterSliderHatchMarkLabel(
          percent: _calculateHatchMatchPercent(
            hatchMarkList[i],
            hatchMarkList[hatchMarkLength],
            hatchMarkList[0],
          ),
          label: _renderHatchMarkText(hatchMarkList[i]),
        ),
      );
    }
    return list;
  }

  double _calculateHatchMatchPercent(double value, double max, double min) {
    return (value - min) / (max - min) * 100;
  }

  Widget _renderHatchMarkText(double value) {
    return Text(
      _formatDecimalNumber(value),
      style: TextStylesApp.regular(
        color: ColorsApp.greyTertiary,
        fontSize: FontSizeApp.s10,
      ),
    );
  }

  String _formatDecimalNumber(double? value) {
    if (value == null) return '-';
    return value.toStringAsFixed(
      NumberUtils.isDecimalStartWith0(value) ? 0 : 1,
    );
  }

  double _formatValue(double? value, List<double> hatchMarkList) {
    double minHatchMarkList = hatchMarkList[0];
    double maxHatchMarkList = hatchMarkList[hatchMarkList.length - 1];
    if (value == null) {
      return maxHatchMarkList +
          100; // Workaround! - set value greater than max to hide tooltip
    }
    if (value < hatchMarkList[0]) {
      return minHatchMarkList; // prevent slider error when setting value smaller than min
    }
    return value;
  }

  ////////////////////////////////////////////
  // CUSTOM FUNCTION FOR DIFFERENT BAR TYPE //
  ////////////////////////////////////////////

  List<double> _chooseHatchMarkList(BarType barType) {
    switch (barType) {
      case BarType.bodyTemperature:
        if (isCel!) {
          return [34, 35, 37.5, 41.5, 42];
        } else {
          return [93, 95, 99.5, 106.7, 108];
        }
      case BarType.spO2:
        return [85, 90, 100];
    }
  }

  int _chooseColorIndex(BarType barType, List<double> hatchMarkList) {
    switch (barType) {
      case BarType.bodyTemperature:
        return _chooseColorIndexTemp(hatchMarkList);
      case BarType.spO2:
        return _chooseColorIndexSpO2(hatchMarkList);
    }
  }

  int _chooseColorIndexTemp(List<double> hatchMarkList) {
    if (value == null) return 1;
    if (value! < hatchMarkList[1]) {
      return 0;
    }
    if (value! <= hatchMarkList[2]) {
      return 1;
    }
    if (value! <= hatchMarkList[3]) {
      return 2;
    }
    return 3;
  }

  int _chooseColorIndexSpO2(List<double> hatchMarkList) {
    if (value == null) return 1;
    if (value! >= hatchMarkList[1]) {
      return 1;
    }
    return 0;
  }

  List<Color> _chooseColorList(BarType barType) {
    switch (barType) {
      case BarType.bodyTemperature:
        return [
          ColorsApp.blueMainChart,
          ColorsApp.successPrimary,
          ColorsApp.attention,
          ColorsApp.error,
        ];
      case BarType.spO2:
        return [ColorsApp.yellow, ColorsApp.blueMainChart];
    }
  }

  List<Color> _chooseBorderColorList(BarType barType) {
    switch (barType) {
      case BarType.bodyTemperature:
        return [
          ColorsApp.blueTertiary,
          ColorsApp.successSecondary,
          ColorsApp.attentionSecondary,
          ColorsApp.errorSecondary,
        ];
      case BarType.spO2:
        return [ColorsApp.attentionSecondary, ColorsApp.blueTertiary];
    }
  }

  List<int> _calculateColorWidth(BarType barType) {
    switch (barType) {
      case BarType.bodyTemperature:
        if (isCel!) {
          // [34-34.95, 34.96-37.55, 37.56-41.55, 41.56-42]
          return [96, 260, 400, 45];
        }
        // [93-94.95, 94.96-99.55, 99.56-106.75, 106.76-108]
        return [196, 460, 720, 125];
      case BarType.spO2:
        // [<90, 90 -100]
        return [(5 / 15 * 100).toInt(), (10 / 15 * 100).toInt()];
    }
  }
}
''',
);
