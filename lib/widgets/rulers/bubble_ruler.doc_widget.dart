// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class BubbleColorBarDocWidget implements Documentation {
  @override
  String get name => 'BubbleColorBar';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'value',
          isRequired: false,
          isNamed: true,
          type: 'double?',
          description: 'Current [value] of Description Bar',
        ),
        PropertyDoc(
          name: 'barType',
          isRequired: true,
          isNamed: true,
          type: 'BarType',
          description: 'Type of this bar. Currently only support 2 types',
        ),
        PropertyDoc(
          name: 'showMarker',
          isRequired: false,
          isNamed: true,
          type: 'bool',
          description: 'Set this to false to hide the marker',
          defaultValue: 'true',
        ),
        PropertyDoc(
          name: 'showBubble',
          isRequired: false,
          isNamed: true,
          type: 'bool?',
          description: 'Set this to false to hide the bubble',
          defaultValue: 'true',
        ),
        PropertyDoc(
          name: 'valueUnit',
          isRequired: false,
          isNamed: true,
          type: 'String?',
          description: 'The unit of [value]',
        ),
        PropertyDoc(
          name: 'isCel',
          isRequired: false,
          isNamed: true,
          type: 'bool?',
          description:
              'Set this if [barType] is body temperature to change the unit type',
          defaultValue: 'true',
        ),
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
      ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
        'dep:another_xlider: 3.0.2',
        'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
        'dep:flutter_svg: 2.2.1'
      ];
}
