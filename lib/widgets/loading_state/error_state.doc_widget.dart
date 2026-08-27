// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ErrorStateDocWidget implements Documentation {
  @override
  String get name => 'ErrorState';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'title',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'Something went wrong. Please try again.',
    ),
    PropertyDoc(
      name: 'retryLabel',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'Retry',
    ),
    PropertyDoc(
      name: 'onRetry',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
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
