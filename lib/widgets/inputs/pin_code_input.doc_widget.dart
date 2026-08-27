// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class PinCodeInputDocWidget implements Documentation {
  @override
  String get name => 'PinCodeInput';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'value', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'onChanged',
      isRequired: true,
      isNamed: true,
      type: 'void Function(String)',
    ),
    PropertyDoc(
      name: 'length',
      isRequired: false,
      isNamed: true,
      type: 'int',
      defaultValue: '6',
    ),
    PropertyDoc(
      name: 'obscure',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description: 'Filled boxes show a dot instead of the digit.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'allowReveal',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Shows the eye button. The "revealed" flag stays local — a PIN in bloc state\n is one `copyWith` away from being logged.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'autofocus',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'enabled',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'errorText',
      isRequired: false,
      isNamed: true,
      type: 'String?',
      description: 'Puts the boxes in an error state and runs one shake.',
    ),
    PropertyDoc(
      name: 'onCompleted',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Fires once, on the edge where the PIN becomes complete — not on every\n keystroke while it stays complete.',
    ),
    PropertyDoc(
      name: 'focusNode',
      isRequired: false,
      isNamed: true,
      type: 'FocusNode?',
      description:
          'Pass one in to move focus between two PIN fields. When passed, the caller\n owns it.',
    ),
    PropertyDoc(
      name: 'semanticsLabel',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'PIN code',
    ),
    PropertyDoc(
      name: 'accent',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
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
