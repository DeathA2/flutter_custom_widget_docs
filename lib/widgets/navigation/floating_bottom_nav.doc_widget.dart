// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class FloatingBottomNavDocWidget implements Documentation {
  @override
  String get name => 'FloatingBottomNav';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'destinations',
      isRequired: true,
      isNamed: true,
      type: 'List<NavDestination>',
    ),
    PropertyDoc(
      name: 'selectedIndex',
      isRequired: true,
      isNamed: true,
      type: 'int',
    ),
    PropertyDoc(
      name: 'onSelected',
      isRequired: true,
      isNamed: true,
      type: 'void Function(int)',
    ),
    PropertyDoc(
      name: 'onAction',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Null hides the action button, leaving the pill as the whole bar.',
    ),
    PropertyDoc(
      name: 'actionLabel',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'Create',
    ),
    PropertyDoc(
      name: 'actionIcon',
      isRequired: false,
      isNamed: true,
      type: 'IconData',
      defaultValue: 'Icons.add_rounded',
    ),
    PropertyDoc(
      name: 'blobColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      description: 'Must match the page background. See the class docs.',
      defaultValue: 'CustomColors.canvas',
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
