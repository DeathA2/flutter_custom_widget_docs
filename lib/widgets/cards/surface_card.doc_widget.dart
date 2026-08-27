// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SurfaceCardDocWidget implements Documentation {
  @override
  String get name => 'SurfaceCard';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'padding',
      isRequired: false,
      isNamed: true,
      type: 'EdgeInsetsGeometry',
      defaultValue: 'const EdgeInsets.all(16)',
    ),
    PropertyDoc(
      name: 'borderColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral200',
    ),
    PropertyDoc(
      name: 'background',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.white',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '18: 18.0',
    ),
    PropertyDoc(
      name: 'onTap',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Null leaves the card non-tappable, with no press feedback wrapper around it.',
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
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// Base card: white background, hairline border, radius 18.
@docWidget
class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderColor = CustomColors.neutral200,
    this.background = CustomColors.white,
    this.radius = 18,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Color background;
  final double radius;

  /// Null leaves the card non-tappable, with no press feedback wrapper around it.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Widget box = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );

    return onTap == null
        ? box
        : TouchableOpacity.scale(onTap: onTap, child: box);
  }
}
''';
}
