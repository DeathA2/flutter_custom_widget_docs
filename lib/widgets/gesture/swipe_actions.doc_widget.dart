// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SwipeActionsDocWidget implements Documentation {
  @override
  String get name => 'SwipeActions';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'actions',
      isRequired: true,
      isNamed: true,
      type: 'List<SwipeAction>',
    ),
    PropertyDoc(
      name: 'actionWidth',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '76: 76.0',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '20: 20.0',
    ),
    PropertyDoc(
      name: 'onLongPress',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Second route to the same set of actions. See the class docs.',
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
