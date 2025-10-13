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
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
        PropertyDoc(
          name: 'label',
          isRequired: true,
          isNamed: true,
          type: 'String',
        ),
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
      ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
        'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)'
      ];
}
