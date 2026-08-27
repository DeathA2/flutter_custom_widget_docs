// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class OutlineButtonDocWidget implements Documentation {
  @override
  String get name => 'OutlineButton';

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
      name: 'busy',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
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
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';

/// Outlined button — the secondary action standing next to
/// [FilledButtonApp] in its [FilledButtonVariant.primaryCta] look.
///
/// Distinct from [OutlinedButtonApp], which is the theme-driven outlined
/// button: this one is fixed-height, brand-coloured and scales on press so it
/// sits flush beside the primary CTA.
@docWidget
class OutlineButton extends StatelessWidget {
  const OutlineButton({
    required this.label,
    required this.onTap,
    this.busy = false,
    this.color = CustomColors.brand,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;
  final bool busy;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      onTap: busy ? null : onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color, width: 1.5),
        ),
        child: busy
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              )
            : Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
      ),
    );
  }
}
''';
}
