// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class IconOutlinedButtonDocWidget implements Documentation {
  @override
  String get name => 'IconOutlinedButton';

  @override
  bool get hasState => false;

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
          name: 'onPressed',
          isRequired: false,
          isNamed: true,
          type: 'void Function()?',
        ),
        PropertyDoc(
          name: 'icon',
          isRequired: true,
          isNamed: true,
          type: 'String',
        ),
        PropertyDoc(
          name: 'bgColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'isEnable',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          defaultValue: 'true',
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
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_svg/svg.dart';

@docWidget
class IconOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String icon;
  final Color? bgColor;
  final bool isEnable;
  const IconOutlinedButton({
    super.key,
    this.onPressed,
    required this.icon,
    this.bgColor,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isEnable ? 1 : 0.3,
      child: OutlinedButton(
        onPressed: isEnable ? onPressed : null,
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p10),
        ),
        child: SvgPicture.asset(
          icon,
          fit: BoxFit.none,
          colorFilter: ColorFilter.mode(ColorsApp.bluePrimary, BlendMode.srcIn),
        ),
        // label: Text(label),
      ),
    );
  }
}
''';
}
