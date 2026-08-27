// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class AppTextFieldDocWidget implements Documentation {
  @override
  String get name => 'AppTextField';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'value', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'onChanged',
      isRequired: false,
      isNamed: true,
      type: 'void Function(String)?',
    ),
    PropertyDoc(
      name: 'label',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'hint',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'helperText',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'errorText',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'keyboardType',
      isRequired: false,
      isNamed: true,
      type: 'TextInputType?',
    ),
    PropertyDoc(
      name: 'obscureText',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'textAlign',
      isRequired: false,
      isNamed: true,
      type: 'TextAlign',
      defaultValue: 'TextAlign.start',
    ),
    PropertyDoc(
      name: 'maxLength',
      isRequired: false,
      isNamed: true,
      type: 'int?',
    ),
    PropertyDoc(
      name: 'maxLines',
      isRequired: false,
      isNamed: true,
      type: 'int',
      defaultValue: '1',
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
      name: 'readOnly',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'inputFormatters',
      isRequired: false,
      isNamed: true,
      type: 'List<TextInputFormatter>?',
    ),
    PropertyDoc(
      name: 'onSubmitted',
      isRequired: false,
      isNamed: true,
      type: 'void Function(String)?',
    ),
    PropertyDoc(
      name: 'focusNode',
      isRequired: false,
      isNamed: true,
      type: 'FocusNode?',
    ),
    PropertyDoc(
      name: 'prefixIcon',
      isRequired: false,
      isNamed: true,
      type: 'IconData?',
    ),
    PropertyDoc(
      name: 'clearable',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description: 'Shows a clear button while there is content.',
      defaultValue: 'true',
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
