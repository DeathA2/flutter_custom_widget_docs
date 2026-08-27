// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class TextActionButtonDocWidget implements Documentation {
  @override
  String get name => 'TextActionButton';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'label', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'onTap',
      isRequired: true,
      isNamed: true,
      type: 'void Function()?',
    ),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
    ),
    PropertyDoc(
      name: 'icon',
      isRequired: false,
      isNamed: true,
      type: 'IconData?',
    ),
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// Text button whose tap target stays at least 48pt even when the label is short.
@docWidget
class TextActionButton extends StatelessWidget {
  const TextActionButton({
    required this.label,
    required this.onTap,
    this.color = CustomColors.brand,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      minSize: 48,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null) ...<Widget>[
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''';
}
