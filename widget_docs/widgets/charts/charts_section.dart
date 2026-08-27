import 'package:doc_widget/doc_widget.dart';

import 'progress_bar/progress_bar_preview.dart';
import 'progress_ring/progress_ring_preview.dart';
import 'gauge_meter/gauge_meter_preview.dart';
import 'donut_chart/donut_chart_preview.dart';
import 'line_chart/line_chart_preview.dart';

ElementsSection renderChartsSection() {
  return ElementsSection(
    elements: [
      progressBarPreview,
      progressRingPreview,
      gaugeMeterPreview,
      donutChartPreview,
      lineChartPreview,
    ],
    title: 'Charts & Progress',
  );
}
