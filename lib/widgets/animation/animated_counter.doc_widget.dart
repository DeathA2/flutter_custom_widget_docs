// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class AnimatedCounterDocWidget implements Documentation {
  @override
  String get name => 'AnimatedCounter';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'value', isRequired: true, isNamed: true, type: 'double'),
    PropertyDoc(
      name: 'formatter',
      isRequired: true,
      isNamed: true,
      type: 'String Function(double)',
      description:
          'Formats the value into a string. Passed in so the widget stays unaware of\n locale and currency.',
    ),
    PropertyDoc(
      name: 'style',
      isRequired: false,
      isNamed: true,
      type: 'TextStyle?',
    ),
    PropertyDoc(
      name: 'duration',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      defaultValue: 'const Duration(milliseconds: 520)',
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
