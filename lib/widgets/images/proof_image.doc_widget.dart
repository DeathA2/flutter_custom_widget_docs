// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ProofImageDocWidget implements Documentation {
  @override
  String get name => 'ProofImage';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'pathOrUrl',
      isRequired: true,
      isNamed: true,
      type: 'String',
    ),
    PropertyDoc(
      name: 'fit',
      isRequired: false,
      isNamed: true,
      type: 'BoxFit',
      defaultValue: 'BoxFit.cover',
    ),
    PropertyDoc(
      name: 'aspectRatio',
      isRequired: false,
      isNamed: true,
      type: 'double?',
      description:
          'Null lets the image fill the parent box without forcing a ratio.',
      defaultValue: '4 / 3: 1.3333333333333333',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '16: 16.0',
    ),
    PropertyDoc(
      name: 'emptyLabel',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'tapHint',
      isRequired: false,
      isNamed: true,
      type: 'String?',
      description: 'When set, shows a "tap to zoom" hint pill in the corner.',
    ),
    PropertyDoc(
      name: 'onTapWhenMissing',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Called when the user taps and there is no file — usually reopens the camera.',
    ),
    PropertyDoc(
      name: 'placeholder',
      isRequired: false,
      isNamed: true,
      type: 'Widget?',
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
