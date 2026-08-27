// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class CountBadgeDocWidget implements Documentation {
  @override
  String get name => 'CountBadge';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'count', isRequired: true, isNamed: true, type: 'int'),
    PropertyDoc(
      name: 'compact',
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
      defaultValue: 'CustomColors.error',
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

/// Red count badge, meant to sit over an icon inside a `Stack`.
@docWidget
class CountBadge extends StatelessWidget {
  const CountBadge({
    required this.count,
    this.compact = false,
    this.color = CustomColors.error,
    super.key,
  });

  final int count;
  final bool compact;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    final String label = count > 99 ? '99+' : '\$count';
    final double size = compact ? 16 : 18;
    final bool isWide = label.length > 1;

    return Container(
      width: isWide ? null : size,
      height: size,
      constraints: BoxConstraints(minWidth: size, minHeight: size),
      padding: EdgeInsets.symmetric(horizontal: isWide ? (compact ? 4 : 5) : 0),
      decoration: BoxDecoration(
        color: color,
        shape: isWide ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isWide ? BorderRadius.circular(999) : null,
        border: Border.all(color: CustomColors.white, width: 1.5),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: CustomColors.white,
          fontSize: compact ? 9 : 10,
          fontWeight: FontWeight.w800,
          height: 1,
        ),
      ),
    );
  }
}
''';
}
