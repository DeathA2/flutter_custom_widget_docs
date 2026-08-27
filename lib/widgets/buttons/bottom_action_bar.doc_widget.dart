// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class BottomActionBarDocWidget implements Documentation {
  @override
  String get name => 'BottomActionBar';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'background',
      isRequired: false,
      isNamed: true,
      type: 'Color?',
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

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Action bar pinned to the bottom of the screen.
@docWidget
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({required this.child, this.background, super.key});

  final Widget child;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background ?? CustomColors.white,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          10,
          16,
          12 +
              MediaQuery.viewInsetsOf(context).bottom +
              MediaQuery.paddingOf(context).bottom,
        ),
        child: child,
      ),
    );
  }
}
''';
}
