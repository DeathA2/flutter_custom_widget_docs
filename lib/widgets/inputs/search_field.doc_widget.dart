// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SearchFieldDocWidget implements Documentation {
  @override
  String get name => 'SearchField';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'value', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'onChanged',
      isRequired: true,
      isNamed: true,
      type: 'void Function(String)',
    ),
    PropertyDoc(
      name: 'hint',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'Search',
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
