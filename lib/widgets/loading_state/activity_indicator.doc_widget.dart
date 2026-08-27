// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ActivityIndicatorDocWidget implements Documentation {
  @override
  String get name => 'ActivityIndicator';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '12: 12.0',
    ),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color?',
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
