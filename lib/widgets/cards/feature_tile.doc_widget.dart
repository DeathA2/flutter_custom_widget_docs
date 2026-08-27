// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class FeatureTileDocWidget implements Documentation {
  @override
  String get name => 'FeatureTile';

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
    PropertyDoc(name: 'title', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'subtitle',
      isRequired: true,
      isNamed: true,
      type: 'String',
    ),
    PropertyDoc(
      name: 'onTap',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
    ),
    PropertyDoc(
      name: 'accent',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
    ),
    PropertyDoc(
      name: 'badgeCount',
      isRequired: false,
      isNamed: true,
      type: 'int',
      defaultValue: '0',
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
}
