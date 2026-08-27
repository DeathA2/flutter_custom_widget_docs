import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/week_strip.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/week_strip.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = WeekStripDocWidget();

final weekStripPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Week Strip",
  description:
      "Seven days with five distinct states — done, today done, today pending, missed, upcoming — each differing in both colour and shape, so the strip reads without a legend. It is deliberately static: which cells are lit is *information*, and an animation here would replay \"you did it!\" on every remount. `large` is not just a size; it is the variant for young readers, where days carry a sticker instead of a dot and today gets a solid cell with a TODAY label.",
  dependencies: _documentation.dependencies,
  code: r'''
WeekStrip(
  days: const [
    WeekDay(label: 'Mon', state: DayState.done, dayNumber: 12),
    WeekDay(label: 'Tue', state: DayState.todayPending, dayNumber: 13),
  ],
  selectedIndex: 1,
  onDayTap: (i) => setState(() => selected = i),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<int>(
      initial: 3,
      builder: (BuildContext context, int value, ValueChanged<int> set) =>
          DemoSurface(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: WeekStrip(
              selectedIndex: value,
              onDayTap: set,
              days: const [
                WeekDay(label: 'Mon', state: DayState.done, dayNumber: 12),
                WeekDay(label: 'Tue', state: DayState.done, dayNumber: 13),
                WeekDay(label: 'Wed', state: DayState.missed, dayNumber: 14),
                WeekDay(
                  label: 'Thu',
                  state: DayState.todayPending,
                  dayNumber: 15,
                ),
                WeekDay(label: 'Fri', state: DayState.upcoming, dayNumber: 16),
                WeekDay(label: 'Sat', state: DayState.upcoming, dayNumber: 17),
                WeekDay(label: 'Sun', state: DayState.upcoming, dayNumber: 18),
              ],
            ),
          ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// State of one day cell in a [WeekStrip].
enum DayState {
  /// A past day, completed.
  done,

  /// Today, completed.
  todayDone,

  /// Today, not done yet.
  todayPending,

  /// A past day, missed.
  missed,

  /// A day still ahead.
  upcoming,
}

/// One day in a [WeekStrip].
class WeekDay {
  const WeekDay({
    required this.label,
    required this.state,
    this.dayNumber,
    this.glyph,
  });

  /// "Mon", "Sun", or "Today" for the current cell in the large variant.
  final String label;

  final DayState state;

  /// Day of the month. Null shows only the label and the marker.
  final int? dayNumber;

  /// Sticker for this day alone. Null uses the default marker for [state].
  final String? glyph;

  bool get isToday =>
      state == DayState.todayDone || state == DayState.todayPending;
}

/// Seven-day week strip.
@docWidget
class WeekStrip extends StatelessWidget {
  const WeekStrip({
    required this.days,
    this.selectedIndex,
    this.onDayTap,
    this.large = false,
    this.accent = CustomColors.reward,
    this.todayLabel = 'TODAY',
    super.key,
  });

  final List<WeekDay> days;

  /// Null means no day is selected.
  final int? selectedIndex;

  /// Null makes the whole strip read-only.
  final ValueChanged<int>? onDayTap;

  final bool large;
  final Color accent;
  final String todayLabel;

  @override
  Widget build(BuildContext context) {
    final Widget row = Row(
      children: <Widget>[
        for (int i = 0; i < days.length; i++)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: _DayCell(
                day: days[i],
                selected: selectedIndex == i,
                large: large,
                accent: accent,
                todayLabel: todayLabel,
                onTap: onDayTap == null ? null : () => onDayTap!(i),
              ),
            ),
          ),
      ],
    );

    if (!large) return row;

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: CustomColors.gold.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
      child: row,
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.day,
    required this.selected,
    required this.large,
    required this.accent,
    required this.todayLabel,
    required this.onTap,
  });

  final WeekDay day;
  final bool selected;
  final bool large;
  final Color accent;
  final String todayLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final (
      Color background,
      Color border,
      Color foreground,
    ) = switch (day.state) {
      DayState.done => (accent.withValues(alpha: 0.14), accent, accent),
      DayState.todayDone => (accent, accent, CustomColors.white),
      DayState.todayPending => (CustomColors.white, accent, accent),
      DayState.missed => (
        CustomColors.neutral100,
        CustomColors.neutral200,
        CustomColors.neutral500,
      ),
      DayState.upcoming => (
        CustomColors.white,
        CustomColors.neutral200,
        CustomColors.neutral400,
      ),
    };

    final (Color fillColor, Color borderColor, Color fgColor) = selected
        ? (CustomColors.brand, CustomColors.brand, CustomColors.white)
        : (background, border, foreground);

    final Widget cell = Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            day.label,
            maxLines: 1,
            style: TextStyle(
              fontSize: large ? 12 : 11,
              fontWeight: FontWeight.w700,
              color: selected ? CustomColors.white : CustomColors.neutral500,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: large ? 52 : 44,
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(large ? 18 : 14),
            border: Border.all(color: borderColor, width: day.isToday ? 2 : 1),
          ),
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (day.dayNumber != null)
                  Text(
                    '${day.dayNumber}',
                    style: TextStyle(
                      fontSize: large ? 16 : 14,
                      fontWeight: FontWeight.w800,
                      color: fgColor,
                    ),
                  ),
                Text(
                  day.glyph ??
                      switch (day.state) {
                        DayState.done || DayState.todayDone => '🔥',
                        _ => '·',
                      },
                  style: TextStyle(fontSize: large ? 16 : 14, color: fgColor),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 12,
          child: day.isToday
              ? FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    todayLabel,
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: selected ? CustomColors.white : CustomColors.gold,
                    ),
                  ),
                )
              : null,
        ),
      ],
    );

    final Widget semantic = Semantics(
      label:
          '${day.label}, ${switch (day.state) {
            DayState.done => 'done',
            DayState.todayDone => 'today, done',
            DayState.todayPending => 'today, not done',
            DayState.missed => 'missed',
            DayState.upcoming => 'upcoming',
          }}',
      excludeSemantics: true,
      button: onTap != null,
      child: cell,
    );

    return onTap == null
        ? semantic
        : TouchableOpacity.scale(onTap: onTap, child: semantic);
  }
}
  ''',
);
