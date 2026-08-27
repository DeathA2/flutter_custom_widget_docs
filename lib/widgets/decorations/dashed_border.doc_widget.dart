// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class DashedBorderDocWidget implements Documentation {
  @override
  String get name => 'DashedBorder';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral400',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '16: 16.0',
    ),
    PropertyDoc(
      name: 'strokeWidth',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '1.5',
    ),
    PropertyDoc(
      name: 'dash',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '5: 5.0',
    ),
    PropertyDoc(
      name: 'gap',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '4: 4.0',
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
