// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class EmptyStateDocWidget implements Documentation {
  @override
  String get name => 'EmptyState';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'title', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'body',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'emoji',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: '📭',
    ),
    PropertyDoc(
      name: 'icon',
      isRequired: false,
      isNamed: true,
      type: 'IconData?',
    ),
    PropertyDoc(
      name: 'action',
      isRequired: false,
      isNamed: true,
      type: 'Widget?',
    ),
    PropertyDoc(
      name: 'onSpeak',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Speaker button for readers who cannot read yet. Null hides it.',
    ),
    PropertyDoc(
      name: 'large',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'bottomReserve',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '0: 0.0',
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
