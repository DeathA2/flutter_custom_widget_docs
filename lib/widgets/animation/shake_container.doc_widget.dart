// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ShakeContainerDocWidget implements Documentation {
  @override
  String get name => 'ShakeContainer';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
    PropertyDoc(
      name: 'child',
      isRequired: true,
      isNamed: true,
      type: 'Widget',
      description:
          'The child widget that will be wrapped and animated with a shake effect.',
    ),
    PropertyDoc(
      name: 'shakeOffset',
      isRequired: true,
      isNamed: true,
      type: 'double',
      description:
          'The maximum horizontal offset (in pixels) for the shake amplitude.',
    ),
    PropertyDoc(
      name: 'shakeCount',
      isRequired: false,
      isNamed: true,
      type: 'int',
      description: 'Number of shake oscillations in one animation cycle.',
      defaultValue: '3',
    ),
    PropertyDoc(
      name: 'shakeDuration',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      description: 'The total duration of the shake animation.',
      defaultValue: 'const Duration(milliseconds: 400)',
    ),
    PropertyDoc(
      name: 'shakeTrigger',
      isRequired: false,
      isNamed: true,
      type: 'Object?',
      description:
          'Changing this value shakes, including on the first build. Usually the error\n message. Null never shakes on its own — only [ShakeContainerState.shake] does.',
    ),
    PropertyDoc(
      name: 'decay',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Tapers the amplitude to 0 over the animation, so the shake rests exactly\n where it started. Off keeps every swing at full amplitude.',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'respectReducedMotion',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description: 'Stay still when the OS has "reduce motion" turned on.',
      defaultValue: 'true',
    ),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];
}
