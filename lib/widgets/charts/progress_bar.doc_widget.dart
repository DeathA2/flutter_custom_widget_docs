// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ProgressBarDocWidget implements Documentation {
  @override
  String get name => 'ProgressBar';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'fraction',
      isRequired: true,
      isNamed: true,
      type: 'double',
    ),
    PropertyDoc(
      name: 'identity',
      isRequired: true,
      isNamed: true,
      type: 'Object',
      description: 'What this bar is about — see the class docs.',
    ),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
    ),
    PropertyDoc(
      name: 'trackColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral200',
    ),
    PropertyDoc(
      name: 'minHeight',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '12: 12.0',
    ),
    PropertyDoc(
      name: 'gradientColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description:
          'Two or more colours fills with a gradient. Null keeps the flat [color].',
    ),
    PropertyDoc(
      name: 'shimmer',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Light band sweeping across the filled part, looping forever.',
      defaultValue: 'false',
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
