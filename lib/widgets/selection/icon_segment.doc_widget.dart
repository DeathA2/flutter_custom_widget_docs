// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class IconSegmentDocWidget implements Documentation {
  @override
  String get name => 'IconSegment';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'options',
      isRequired: true,
      isNamed: true,
      type: 'List<SelectionOption<T>>',
    ),
    PropertyDoc(name: 'selected', isRequired: true, isNamed: true, type: 'T'),
    PropertyDoc(
      name: 'onChanged',
      isRequired: true,
      isNamed: true,
      type: 'void Function(T)',
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
