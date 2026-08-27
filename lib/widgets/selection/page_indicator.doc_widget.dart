// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class PageIndicatorDocWidget implements Documentation {
  @override
  String get name => 'PageIndicator';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'count', isRequired: true, isNamed: true, type: 'int'),
    PropertyDoc(
      name: 'currentIndex',
      isRequired: true,
      isNamed: true,
      type: 'int',
    ),
    PropertyDoc(
      name: 'activeColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
    ),
    PropertyDoc(
      name: 'inactiveColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral200',
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

/// Page indicator for onboarding and carousels: the active dot stretches into
/// a bar.
@docWidget
class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.count,
    required this.currentIndex,
    this.activeColor = CustomColors.brand,
    this.inactiveColor = CustomColors.neutral200,
    super.key,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      label: 'Page \${currentIndex + 1} of \$count',
      excludeSemantics: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(count, (int index) {
          final bool isActive = index == currentIndex;
          return AnimatedContainer(
            duration: reduceMotion
                ? Duration.zero
                : const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 28 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }
}
''';
}
