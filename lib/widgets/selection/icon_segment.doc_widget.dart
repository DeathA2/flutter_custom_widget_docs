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

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/selection_option.dart';

/// Small icon-only segmented control — fits `AppBar.actions`.
@docWidget
class IconSegment<T> extends StatelessWidget {
  const IconSegment({
    required this.options,
    required this.selected,
    required this.onChanged,
    this.accent = CustomColors.brand,
    super.key,
  });

  final List<SelectionOption<T>> options;
  final T selected;
  final ValueChanged<T> onChanged;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Container(
      height: 38,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: CustomColors.neutral100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: CustomColors.neutral200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (final SelectionOption<T> option in options)
            Tooltip(
              message: option.label,
              child: TouchableOpacity.scale(
                isButton: true,
                semanticsLabel: option.label,
                onTap: () => onChanged(option.value),
                child: AnimatedContainer(
                  duration: reduceMotion
                      ? Duration.zero
                      : const Duration(milliseconds: 180),
                  width: 42,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: option.value == selected
                        ? accent
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: option.value == selected
                        ? <BoxShadow>[
                            BoxShadow(
                              color: accent.withValues(alpha: 0.28),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                  child: Icon(
                    option.icon,
                    size: 20,
                    color: option.value == selected
                        ? CustomColors.white
                        : CustomColors.neutral500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
''';
}
