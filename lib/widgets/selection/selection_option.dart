import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/filter_chip_bar.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/icon_segment.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/segmented_tabs.dart';

/// One option in a [SegmentedTabs], [FilterChipBar] or [IconSegment].
class SelectionOption<T> {
  const SelectionOption({required this.value, required this.label, this.icon});

  final T value;
  final String label;
  final IconData? icon;
}
