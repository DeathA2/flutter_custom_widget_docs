import 'package:doc_widget/doc_widget.dart';

import 'segmented_tabs/segmented_tabs_preview.dart';
import 'icon_segment/icon_segment_preview.dart';
import 'filter_chip_bar/filter_chip_bar_preview.dart';
import 'week_strip/week_strip_preview.dart';
import 'page_indicator/page_indicator_preview.dart';
import 'count_badge/count_badge_preview.dart';

ElementsSection renderSelectionSection() {
  return ElementsSection(
    elements: [
      segmentedTabsPreview,
      iconSegmentPreview,
      filterChipBarPreview,
      weekStripPreview,
      pageIndicatorPreview,
      countBadgePreview,
    ],
    title: 'Selection Controls',
  );
}
