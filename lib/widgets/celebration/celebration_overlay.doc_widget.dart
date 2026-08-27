// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class CelebrationOverlayDocWidget implements Documentation {
  @override
  String get name => 'CelebrationOverlay';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'message',
      isRequired: true,
      isNamed: true,
      type: 'String',
    ),
    PropertyDoc(
      name: 'kind',
      isRequired: false,
      isNamed: true,
      type: 'CelebrationKind',
      defaultValue: 'CelebrationKind.success',
    ),
    PropertyDoc(
      name: 'visual',
      isRequired: false,
      isNamed: true,
      type: 'Widget?',
      description:
          'Replaces the artwork above the message. Confetti, duration, barrier and\n dismissal still come from here, so the app keeps a single celebration overlay.',
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
