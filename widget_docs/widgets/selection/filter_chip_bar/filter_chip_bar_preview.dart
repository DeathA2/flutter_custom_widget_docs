import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/filter_chip_bar.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/filter_chip_bar.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/selection_option.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = FilterChipBarDocWidget();

final filterChipBarPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Filter Chip Bar",
  description:
      "Horizontally scrolling row of filter chips; the selected chip changes both background and foreground. It scrolls rather than wraps on purpose — five labels do not fit a 393pt screen, and a two-line chip row pushes the first real card below the fold. No count badges here either: the bottom nav already carries that number, and two badges for one count is a reliable way to make them disagree.",
  dependencies: _documentation.dependencies,
  code: r'''
FilterChipBar<String>(
  options: const [
    SelectionOption(value: 'all', label: 'All'),
    SelectionOption(value: 'new', label: 'New', icon: Icons.star_rounded),
  ],
  selected: selected,
  onSelected: (v) => setState(() => selected = v),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<String>(
      initial: 'all',
      builder: (BuildContext context, String value, ValueChanged<String> set) =>
          DemoSurface(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: FilterChipBar<String>(
              options: const [
                SelectionOption(value: 'all', label: 'All'),
                SelectionOption(
                  value: 'new',
                  label: 'New',
                  icon: Icons.star_rounded,
                ),
                SelectionOption(
                  value: 'done',
                  label: 'Done',
                  icon: Icons.check_rounded,
                ),
                SelectionOption(value: 'late', label: 'Overdue'),
              ],
              selected: value,
              onSelected: set,
            ),
          ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
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
  ''',
);
