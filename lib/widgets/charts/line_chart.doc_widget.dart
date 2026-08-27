// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class LineChartDocWidget implements Documentation {
  @override
  String get name => 'LineChart';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'series',
      isRequired: true,
      isNamed: true,
      type: 'List<ChartSeries>',
    ),
    PropertyDoc(
      name: 'labels',
      isRequired: true,
      isNamed: true,
      type: 'List<String>',
    ),
    PropertyDoc(
      name: 'onToggleSeries',
      isRequired: false,
      isNamed: true,
      type: 'void Function(String)?',
      description: 'Null makes the legend read-only.',
    ),
    PropertyDoc(
      name: 'height',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '180: 180.0',
    ),
    PropertyDoc(
      name: 'hint',
      isRequired: false,
      isNamed: true,
      type: 'String?',
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
