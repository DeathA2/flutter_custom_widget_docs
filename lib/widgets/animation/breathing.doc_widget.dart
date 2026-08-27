// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class BreathingDocWidget implements Documentation {
  @override
  String get name => 'Breathing';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'enabled',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'scaleAmount',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'How much larger it grows at the peak. `0.05` means +5%.',
      defaultValue: '0.05',
    ),
    PropertyDoc(
      name: 'liftAmount',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'How many pixels it lifts at the peak. 0 scales only.',
      defaultValue: '0: 0.0',
    ),
    PropertyDoc(
      name: 'period',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      defaultValue: 'const Duration(milliseconds: 3000)',
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
