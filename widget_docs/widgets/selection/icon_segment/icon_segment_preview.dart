import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/icon_segment.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/icon_segment.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/selection_option.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = IconSegmentDocWidget();

final iconSegmentPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Icon Segment",
  description:
      "Small icon-only segmented control, sized to fit `AppBar.actions` — for switching a calendar view or a sort order, where the shape says it faster than a word would. Options are passed in rather than read off `enum.values`, because no single audience should see every mode; each cell still carries its own semantics label, so a screen reader does not announce a row of anonymous buttons.",
  dependencies: _documentation.dependencies,
  code: r'''
IconSegment<String>(
  options: const [
    SelectionOption(value: 'list', label: 'List', icon: Icons.list_rounded),
    SelectionOption(value: 'grid', label: 'Grid', icon: Icons.grid_view_rounded),
  ],
  selected: selected,
  onChanged: (v) => setState(() => selected = v),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<String>(
      initial: 'list',
      builder: (BuildContext context, String value, ValueChanged<String> set) =>
          DemoSurface(
            child: IconSegment<String>(
              options: const [
                SelectionOption(
                  value: 'list',
                  label: 'List',
                  icon: Icons.list_rounded,
                ),
                SelectionOption(
                  value: 'grid',
                  label: 'Grid',
                  icon: Icons.grid_view_rounded,
                ),
                SelectionOption(
                  value: 'chart',
                  label: 'Chart',
                  icon: Icons.show_chart_rounded,
                ),
              ],
              selected: value,
              onChanged: set,
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
  ''',
);
