// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class FilledButtonAppDocWidget implements Documentation {
  @override
  String get name => 'FilledButtonApp';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
    PropertyDoc(name: 'label', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'isLoading',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color?',
    ),
    PropertyDoc(
      name: 'textColor',
      isRequired: false,
      isNamed: true,
      type: 'Color?',
    ),
    PropertyDoc(
      name: 'textColorDiable',
      isRequired: false,
      isNamed: true,
      type: 'Color?',
    ),
    PropertyDoc(
      name: 'onPressed',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
    ),
    PropertyDoc(
      name: 'isEnable',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'hasShadow',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'labelStyle',
      isRequired: false,
      isNamed: true,
      type: 'TextStyle?',
    ),
    PropertyDoc(
      name: 'paddingButton',
      isRequired: false,
      isNamed: true,
      type: 'EdgeInsetsGeometry?',
    ),
    PropertyDoc(
      name: 'variant',
      isRequired: false,
      isNamed: true,
      type: 'FilledButtonVariant',
      description: 'Which of the two looks to draw. See [FilledButtonVariant].',
      defaultValue: 'FilledButtonVariant.themed',
    ),
    PropertyDoc(
      name: 'fullWidth',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Fill the width the parent offers. [FilledButtonVariant.primaryCta] only.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'large',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Large size: 56 tall instead of 52, 17pt label instead of 15, radius 18\n instead of 14. [FilledButtonVariant.primaryCta] only.',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'borderRadius',
      isRequired: false,
      isNamed: true,
      type: 'double?',
      description:
          'Overrides the corner radius of [FilledButtonVariant.primaryCta].',
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
