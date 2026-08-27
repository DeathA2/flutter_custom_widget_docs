// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class EvolutionVisualDocWidget implements Documentation {
  @override
  String get name => 'EvolutionVisual';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'from',
      isRequired: true,
      isNamed: true,
      type: 'String',
      description: 'Glyph of the current thing.',
    ),
    PropertyDoc(
      name: 'to',
      isRequired: true,
      isNamed: true,
      type: 'String',
      description: 'Glyph of what it just became.',
    ),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '180: 180.0',
    ),
    PropertyDoc(
      name: 'rayColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description:
          'Colour of the burst that covers the swap. Null uses gold to orange.',
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
