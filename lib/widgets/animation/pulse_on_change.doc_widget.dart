// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class PulseOnChangeDocWidget implements Documentation {
  @override
  String get name => 'PulseOnChange';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'active', isRequired: true, isNamed: true, type: 'bool'),
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'peak',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '1.06',
    ),
    PropertyDoc(
      name: 'duration',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      defaultValue: 'const Duration(milliseconds: 900)',
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
