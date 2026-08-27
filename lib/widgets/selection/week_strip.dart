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
