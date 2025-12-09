import 'package:doc_widget/doc_widget.dart';
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
