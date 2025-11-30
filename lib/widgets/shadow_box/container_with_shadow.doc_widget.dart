// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ContainerWithShadowDocWidget implements Documentation {
  @override
  String get name => 'ContainerWithShadow';

  @override
  bool get hasState => false;

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
          name: 'shadowColor',
          isRequired: false,
          isNamed: true,
          type: 'Color?',
        ),
        PropertyDoc(
          name: 'shadowXY',
          isRequired: false,
          isNamed: true,
          type: 'Offset',
          defaultValue: 'OffsetApp.o04',
        ),
        PropertyDoc(
          name: 'shadowB',
          isRequired: false,
          isNamed: true,
          type: 'double',
          defaultValue: 'BlurRadiusApp.b10: 10.0',
        ),
        PropertyDoc(
          name: 'shadowS',
          isRequired: false,
          isNamed: true,
          type: 'double',
          defaultValue: 'SpreadRadiusApp.s0: 0.0',
        ),
      ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
        'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)'
      ];
}
