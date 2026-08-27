// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class TouchableOpacityDocWidget implements Documentation {
  @override
  String get name => 'TouchableOpacity';

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
      description: 'The wrapped content.',
    ),
    PropertyDoc(
      name: 'onTap',
      isRequired: true,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Called on tap. Null disables interaction — the widget stops taking taps and,\n when [isButton], reports itself disabled to screen readers.',
    ),
    PropertyDoc(
      name: 'onLongPress',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Secondary action on long press. Also exposed to screen readers as a\n long-press action.',
    ),
    PropertyDoc(
      name: 'duration',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      description: 'Duration of the fade / scale animation.',
      defaultValue: 'const Duration(milliseconds: 50)',
    ),
    PropertyDoc(
      name: 'pressedOpacity',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'Opacity while pressed. `1.0` leaves opacity unchanged.',
      defaultValue: '0.5',
    ),
    PropertyDoc(
      name: 'pressedScale',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'Scale while pressed. `1.0` leaves size unchanged.',
      defaultValue: '1.0',
    ),
    PropertyDoc(
      name: 'isButton',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Declares this a button, enabled or disabled according to [onTap].',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'semanticsLabel',
      isRequired: false,
      isNamed: true,
      type: 'String?',
      description:
          'One label for the whole tap target. It *replaces* whatever the subtree reads\n out, so leave it null when the subtree already says the right thing.',
    ),
    PropertyDoc(
      name: 'minSize',
      isRequired: false,
      isNamed: true,
      type: 'double?',
      description:
          'Smallest side of the tap target in logical pixels. Pass `48` for anything\n platform guidelines would flag; the visible part keeps its own size.',
    ),
    PropertyDoc(
      name: 'deferTap',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Defers [onTap] until after the current frame. Turn on for buttons whose\n callback navigates or opens a sheet.',
      defaultValue: 'false',
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
