// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class NetworkImageViewDocWidget implements Documentation {
  @override
  String get name => 'NetworkImageView';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'url', isRequired: true, isNamed: false, type: 'String?'),
    PropertyDoc(
      name: 'fit',
      isRequired: false,
      isNamed: true,
      type: 'BoxFit',
      defaultValue: 'BoxFit.cover',
    ),
    PropertyDoc(
      name: 'width',
      isRequired: false,
      isNamed: true,
      type: 'double?',
    ),
    PropertyDoc(
      name: 'height',
      isRequired: false,
      isNamed: true,
      type: 'double?',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '0: 0.0',
    ),
    PropertyDoc(
      name: 'placeholderColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral100',
    ),
    PropertyDoc(
      name: 'semanticLabel',
      isRequired: false,
      isNamed: true,
      type: 'String?',
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
