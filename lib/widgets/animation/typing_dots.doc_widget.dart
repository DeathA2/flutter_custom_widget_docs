// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class TypingDotsDocWidget implements Documentation {
  @override
  String get name => 'TypingDots';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral500',
    ),
    PropertyDoc(
      name: 'dotSize',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '7: 7.0',
    ),
    PropertyDoc(
      name: 'gap',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '5: 5.0',
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
