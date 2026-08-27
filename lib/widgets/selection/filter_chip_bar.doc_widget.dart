// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class FilterChipBarDocWidget implements Documentation {
  @override
  String get name => 'FilterChipBar';

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
      name: 'onSelected',
      isRequired: true,
      isNamed: true,
      type: 'void Function(T)',
    ),
    PropertyDoc(
      name: 'selectedColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brandSoft',
    ),
    PropertyDoc(
      name: 'padding',
      isRequired: false,
      isNamed: true,
      type: 'EdgeInsetsGeometry',
      defaultValue: 'const EdgeInsets.symmetric(horizontal: 16)',
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
import 'package:flutter_custom_widget_docs/widgets/selection/selection_option.dart';

/// Horizontally scrolling row of filter chips.
@docWidget
class FilterChipBar<T> extends StatelessWidget {
  const FilterChipBar({
    required this.options,
    required this.selected,
    required this.onSelected,
    this.selectedColor = CustomColors.brandSoft,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    super.key,
  });

  final List<SelectionOption<T>> options;
  final T selected;
  final ValueChanged<T> onSelected;
  final Color selectedColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: padding,
          itemCount: options.length,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(width: 4),
          itemBuilder: (BuildContext context, int i) {
            final SelectionOption<T> option = options[i];
            return _FilterChip(
              label: option.label,
              icon: option.icon,
              isSelected: option.value == selected,
              selectedColor: selectedColor,
              onTap: () => onSelected(option.value),
            );
          },
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.selectedColor,
    required this.onTap,
    this.icon,
  });

  final String label;
  final bool isSelected;
  final Color selectedColor;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      onTap: onTap,
      child: AnimatedContainer(
        duration: reduceMotion
            ? Duration.zero
            : const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null) ...<Widget>[
              Icon(
                icon,
                size: 16,
                color: isSelected ? CustomColors.ink : CustomColors.neutral700,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? CustomColors.ink : CustomColors.neutral700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
''';
}
