// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ShakeContainerDocWidget implements Documentation {
  @override
  String get name => 'ShakeContainer';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
        PropertyDoc(
          name: 'child',
          isRequired: true,
          isNamed: true,
          type: 'Widget',
        ),
        PropertyDoc(
          name: 'shakeOffset',
          isRequired: true,
          isNamed: true,
          type: 'double',
        ),
        PropertyDoc(
          name: 'shakeCount',
          isRequired: false,
          isNamed: true,
          type: 'int',
          defaultValue: '3',
        ),
        PropertyDoc(
          name: 'shakeDuration',
          isRequired: false,
          isNamed: true,
          type: 'Duration',
          defaultValue: 'const Duration(milliseconds: 400)',
        ),
      ];

  @override
  String get snippet => '''
''';
}
