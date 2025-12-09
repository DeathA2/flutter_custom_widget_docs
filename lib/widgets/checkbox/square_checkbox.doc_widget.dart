// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SquareCheckBoxDocWidget implements Documentation {
  @override
  String get name => 'SquareCheckBox';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
        PropertyDoc(
          name: 'label',
          isRequired: true,
          isNamed: true,
          type: 'String',
        ),
        PropertyDoc(
          name: 'checkBoxIsAfter',
          isRequired: false,
          isNamed: true,
          type: 'bool?',
          defaultValue: 'false',
        ),
        PropertyDoc(
          name: 'sublabel',
          isRequired: false,
          isNamed: true,
          type: 'String?',
          defaultValue: '',
        ),
        PropertyDoc(
          name: 'value',
          isRequired: false,
          isNamed: true,
          type: 'bool?',
          defaultValue: 'false',
        ),
        PropertyDoc(
          name: 'onValueChanged',
          isRequired: true,
          isNamed: true,
          type: 'void Function(bool)',
        ),
        PropertyDoc(
          name: 'selectedTextStyle',
          isRequired: false,
          isNamed: true,
          type: 'TextStyle?',
        ),
      ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
        'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
        'dep:flutter_svg: 2.2.1'
      ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/gen/assets.gen.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/utils/strings.dart';

import 'package:flutter_svg/svg.dart';

@docWidget
class SquareCheckBox extends StatefulWidget {
  final String? sublabel;
  final String label;
  final bool? checkBoxIsAfter;
  final TextStyle? selectedTextStyle;
  final bool? value;
  final void Function(bool value) onValueChanged;

  const SquareCheckBox({
    super.key,
    required this.label,
    this.checkBoxIsAfter = false,
    this.sublabel = '',
    this.value = false,
    required this.onValueChanged,
    this.selectedTextStyle,
  });

  @override
  State<SquareCheckBox> createState() => _SquareCheckBoxState();
}

class _SquareCheckBoxState extends State<SquareCheckBox> {
  late bool? _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value!;
        });
        widget.onValueChanged(_value!);
      },
      child: AbsorbPointer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: SizeApp.s8),
          child:
              !widget.checkBoxIsAfter!
                  ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: PaddingApp.p4),
                        child: SvgPicture.asset(
                          !_value!
                              ? Assets.svg.icSquareCheckbox
                              : Assets.svg.icSquareCheckboxFill,
                        ),
                      ),
                      const SizedBox(width: SizeApp.s12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.label,
                              style:
                                  !widget.value!
                                      ? TextStylesApp.regular(
                                        color: ColorsApp.greyPrimary,
                                        fontSize: FontSizeApp.s16,
                                      )
                                      : widget.selectedTextStyle ??
                                          TextStylesApp.bold(
                                            color: ColorsApp.greyPrimary,
                                            fontSize: FontSizeApp.s16,
                                          ),
                            ),
                            isNotNullOrEmpty(widget.sublabel)
                                ? Text(
                                  widget.sublabel ?? '',
                                  style: TextStylesApp.regular(
                                    color: ColorsApp.greyTertiary,
                                    fontSize: FontSizeApp.s14,
                                  ),
                                )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.label,
                              style:
                                  !_value!
                                      ? TextStylesApp.regular(
                                        color: ColorsApp.greyPrimary,
                                        fontSize: FontSizeApp.s16,
                                      )
                                      : widget.selectedTextStyle ??
                                          TextStylesApp.bold(
                                            color: ColorsApp.greyPrimary,
                                            fontSize: FontSizeApp.s16,
                                          ),
                            ),
                            isNotNullOrEmpty(widget.sublabel)
                                ? Text(
                                  widget.sublabel ?? '',
                                  style: TextStylesApp.regular(
                                    color: ColorsApp.greyTertiary,
                                    fontSize: FontSizeApp.s14,
                                  ),
                                )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      const SizedBox(width: SizeApp.s12),
                      Padding(
                        padding: const EdgeInsets.only(top: PaddingApp.p4),
                        child: SvgPicture.asset(
                          !_value!
                              ? Assets.svg.icSquareCheckbox
                              : Assets.svg.icSquareCheckboxFill,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
''';
}
