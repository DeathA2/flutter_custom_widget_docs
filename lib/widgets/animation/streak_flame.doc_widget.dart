// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class StreakFlameDocWidget implements Documentation {
  @override
  String get name => 'StreakFlame';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'days', isRequired: true, isNamed: true, type: 'int'),
    PropertyDoc(
      name: 'isActiveToday',
      isRequired: true,
      isNamed: true,
      type: 'bool',
      description:
          'A live streak with nothing logged today reads dimmer — it is at risk, not lost.',
    ),
    PropertyDoc(
      name: 'activeColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.reward',
    ),
    PropertyDoc(
      name: 'idleColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral400',
    ),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '28: 28.0',
    ),
    PropertyDoc(
      name: 'ambientPulse',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'showCount',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'False draws the flame alone, letting the caller build its own frame around it.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'glyph',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: '🔥',
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
