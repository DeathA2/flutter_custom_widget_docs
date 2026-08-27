// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class CompanionAvatarDocWidget implements Documentation {
  @override
  String get name => 'CompanionAvatar';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'emoji', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'Diameter of the round "well".',
      defaultValue: '126: 126.0',
    ),
    PropertyDoc(
      name: 'emojiSize',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '68: 68.0',
    ),
    PropertyDoc(
      name: 'interactive',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'False drops the tap handler, confetti and haptics, leaving only the breath\n loop — for rows whose parent card is already one tap target.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'badgeLabel',
      isRequired: false,
      isNamed: true,
      type: 'String?',
      description:
          'Pill label hanging under the well, e.g. "Stage 2/5". Null hides it.',
    ),
    PropertyDoc(
      name: 'onTap',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Called after the tap animation runs — for sound, analytics, and so on.',
    ),
    PropertyDoc(
      name: 'wellColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description: 'Well gradient. Null uses the lavender tones.',
    ),
    PropertyDoc(
      name: 'semanticsLabel',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'Tap to pet',
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
