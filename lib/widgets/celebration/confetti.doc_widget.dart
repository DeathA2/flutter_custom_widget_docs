// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ConfettiDocWidget implements Documentation {
  @override
  String get name => 'Confetti';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'controller',
      isRequired: true,
      isNamed: true,
      type: 'ConfettiController',
    ),
    PropertyDoc(
      name: 'alignment',
      isRequired: false,
      isNamed: true,
      type: 'Alignment',
      defaultValue: 'Alignment.topCenter',
    ),
    PropertyDoc(
      name: 'particleCount',
      isRequired: false,
      isNamed: true,
      type: 'int',
      defaultValue: '24',
    ),
    PropertyDoc(
      name: 'colors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description: 'Flake palette. Null uses [CustomColors.confetti].',
    ),
    PropertyDoc(
      name: 'pathBuilder',
      isRequired: false,
      isNamed: true,
      type: 'Path Function(Size)',
      description: 'Shape of one flake, given that flake\'s size.',
      defaultValue: 'ParticlePaths.star: Path star(Size size)',
    ),
    PropertyDoc(
      name: 'minSize',
      isRequired: false,
      isNamed: true,
      type: 'Size',
      defaultValue: 'const Size(8, 8)',
    ),
    PropertyDoc(
      name: 'maxSize',
      isRequired: false,
      isNamed: true,
      type: 'Size',
      defaultValue: 'const Size(14, 16)',
    ),
    PropertyDoc(
      name: 'gravity',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description:
          'Gravity, as a fraction of screen height per second squared.',
      defaultValue: '0.22',
    ),
    PropertyDoc(
      name: 'blastDirection',
      isRequired: false,
      isNamed: true,
      type: 'double?',
      description:
          'Blast direction in radians (0 is right, -pi/2 is up). Null bursts evenly\n in every direction.',
    ),
    PropertyDoc(
      name: 'spread',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description:
          'Width of the blast fan in radians. Ignored when [blastDirection] is null.',
      defaultValue: 'math.pi * 2: 6.283185307179586',
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
