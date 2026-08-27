// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SettingsTileDocWidget implements Documentation {
  @override
  String get name => 'SettingsTile';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'icon',
      isRequired: true,
      isNamed: true,
      type: 'IconData',
    ),
    PropertyDoc(name: 'label', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'onTap',
      isRequired: true,
      isNamed: true,
      type: 'void Function()',
    ),
    PropertyDoc(
      name: 'trailingText',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'trailing',
      isRequired: false,
      isNamed: true,
      type: 'Widget?',
      description:
          'Replaces the chevron entirely — a `Switch`, for example. The row stays\n tappable, so avoid controls that take taps of their own.',
    ),
    PropertyDoc(
      name: 'large',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'accent',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
    ),
    PropertyDoc(
      name: 'destructive',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Sign out / delete account — label and icon turn the error colour.',
      defaultValue: 'false',
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

/// One settings row: icon, label, secondary value, chevron.
@docWidget
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailingText,
    this.trailing,
    this.large = false,
    this.accent = CustomColors.brand,
    this.destructive = false,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? trailingText;

  /// Replaces the chevron entirely — a `Switch`, for example. The row stays
  /// tappable, so avoid controls that take taps of their own.
  final Widget? trailing;

  final bool large;
  final Color accent;

  /// Sign out / delete account — label and icon turn the error colour.
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final Color fg = destructive ? CustomColors.error : accent;

    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: trailingText == null ? label : '\$label, \$trailingText',
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: large ? 16 : 14,
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, size: large ? 26 : 22, color: fg),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: large ? 17 : 15,
                  color: destructive ? CustomColors.error : CustomColors.ink,
                ),
              ),
            ),
            if (trailingText != null) ...<Widget>[
              Text(
                trailingText!,
                style: TextStyle(
                  color: CustomColors.neutral500,
                  fontWeight: FontWeight.w600,
                  fontSize: large ? 15 : 13,
                ),
              ),
              const SizedBox(width: 6),
            ],
            trailing ??
                Icon(
                  Icons.chevron_right_rounded,
                  color: CustomColors.neutral400,
                  size: large ? 26 : 22,
                ),
          ],
        ),
      ),
    );
  }
}
''';
}
