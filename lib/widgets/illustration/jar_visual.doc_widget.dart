// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class JarVisualDocWidget implements Documentation {
  @override
  String get name => 'JarVisual';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'accent', isRequired: true, isNamed: true, type: 'Color'),
    PropertyDoc(
      name: 'content',
      isRequired: false,
      isNamed: true,
      type: 'JarContent',
      defaultValue: 'JarContent.coins',
    ),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '72: 72.0',
    ),
    PropertyDoc(
      name: 'fill',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '0.45',
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
