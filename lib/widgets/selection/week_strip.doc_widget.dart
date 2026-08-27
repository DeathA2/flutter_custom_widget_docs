// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class WeekStripDocWidget implements Documentation {
  @override
  String get name => 'WeekStrip';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'days',
      isRequired: true,
      isNamed: true,
      type: 'List<WeekDay>',
    ),
    PropertyDoc(
      name: 'selectedIndex',
      isRequired: false,
      isNamed: true,
      type: 'int?',
      description: 'Null means no day is selected.',
    ),
    PropertyDoc(
      name: 'onDayTap',
      isRequired: false,
      isNamed: true,
      type: 'void Function(int)?',
      description: 'Null makes the whole strip read-only.',
    ),
    PropertyDoc(
      name: 'large',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'accent',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.reward',
    ),
    PropertyDoc(
      name: 'todayLabel',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'TODAY',
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
