// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SegmentedTabsDocWidget implements Documentation {
  @override
  String get name => 'SegmentedTabs';

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
      name: 'colors',
      isRequired: false,
      isNamed: true,
      type: 'SegmentColors',
      defaultValue: 'SegmentColors.standard',
    ),
    PropertyDoc(
      name: 'height',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '44: 44.0',
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
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/selection_option.dart';

/// Colour set for a [SegmentedTabs].
class SegmentColors {
  const SegmentColors({
    required this.track,
    required this.selected,
    required this.onSelected,
    required this.unselected,
  });

  static const SegmentColors standard = SegmentColors(
    track: CustomColors.neutral100,
    selected: CustomColors.brand,
    onSelected: CustomColors.white,
    unselected: CustomColors.neutral700,
  );

  final Color track;
  final Color selected;
  final Color onSelected;
  final Color unselected;
}

/// Evenly divided segmented control, for any 2-4 item filter.
@docWidget
class SegmentedTabs<T> extends StatelessWidget {
  const SegmentedTabs({
    required this.options,
    required this.selected,
    required this.onChanged,
    this.colors = SegmentColors.standard,
    this.height = 44,
    super.key,
  });

  final List<SelectionOption<T>> options;
  final T selected;
  final ValueChanged<T> onChanged;
  final SegmentColors colors;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colors.track,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: <Widget>[
          for (int i = 0; i < options.length; i++) ...<Widget>[
            if (i > 0) const SizedBox(width: 4),
            Expanded(
              child: _SegmentButton(
                label: options[i].label,
                isSelected: options[i].value == selected,
                colors: colors,
                height: height,
                onTap: () => onChanged(options[i].value),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  const _SegmentButton({
    required this.label,
    required this.isSelected,
    required this.colors,
    required this.height,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final SegmentColors colors;
  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: AnimatedContainer(
        duration: reduceMotion
            ? Duration.zero
            : const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: isSelected ? colors.selected : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          boxShadow: isSelected
              ? <BoxShadow>[
                  BoxShadow(
                    color: colors.selected.withValues(alpha: 0.22),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 14,
              color: isSelected ? colors.onSelected : colors.unselected,
            ),
          ),
        ),
      ),
    );
  }
}
''';
}
