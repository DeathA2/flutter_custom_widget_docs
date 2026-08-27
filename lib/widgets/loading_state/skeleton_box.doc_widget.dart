// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SkeletonBoxDocWidget implements Documentation {
  @override
  String get name => 'SkeletonBox';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'width',
      isRequired: false,
      isNamed: true,
      type: 'double?',
    ),
    PropertyDoc(
      name: 'height',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '14: 14.0',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '8: 8.0',
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
import 'package:flutter_custom_widget_docs/widgets/loading_state/shimmer.dart';

/// One skeleton block. Group several inside a single [Shimmer] so the whole
/// set lights up in phase.
@docWidget
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({this.width, this.height = 14, this.radius = 8, super.key});

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CustomColors.neutral200,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
''';
}
