// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class GaugeMeterDocWidget implements Documentation {
  @override
  String get name => 'GaugeMeter';

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
      name: 'centerLabel',
      isRequired: true,
      isNamed: true,
      type: 'String',
      description: 'Pre-formatted, so the widget stays unaware of locale.',
    ),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '140: 140.0',
    ),
    PropertyDoc(
      name: 'gradientColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description:
          'Two or more colours sweep along the arc. Null uses\n [CustomColors.progressRing].',
    ),
    PropertyDoc(
      name: 'knob',
      isRequired: false,
      isNamed: true,
      type: 'Widget?',
      description:
          'Small widget riding the head of the arc. Null draws a white dot.',
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
