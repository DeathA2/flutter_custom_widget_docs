import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/charts/line_chart.dart';
import 'package:flutter_custom_widget_docs/widgets/charts/line_chart.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = LineChartDocWidget();

final lineChartPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Line Chart",
  description:
      "Multi-series line chart, hand-painted, with a tappable legend to hide and show each series. Two things hand-rolled charts usually forget are handled here: axis labels scale with the system `textScaler`, measured from the scaled font so large-text users do not get labels spilling over the legend; and labels thin themselves out when space runs short, dropping every other one instead of overlapping. The Y axis re-fits to whatever is visible, so hiding a tall series lets the rest expand and become readable.",
  dependencies: _documentation.dependencies,
  code: r'''
LineChart(
  series: [
    ChartSeries(
      id: 'sys',
      label: 'Systolic',
      points: [118, 122, 119, 130, 126, 121, 124],
      color: CustomColors.info,
    ),
  ],
  labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<Set<String>>(
      initial: const <String>{'sys', 'dia'},
      builder:
          (
            BuildContext context,
            Set<String> visible,
            ValueChanged<Set<String>> set,
          ) {
            return DemoSurface(
              child: LineChart(
                labels: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                hint: 'Tap a legend chip to hide or show a series',
                series: [
                  ChartSeries(
                    id: 'sys',
                    label: 'Systolic',
                    points: const [118, 122, 119, 130, 126, 121, 124],
                    color: CustomColors.info,
                    visible: visible.contains('sys'),
                  ),
                  ChartSeries(
                    id: 'dia',
                    label: 'Diastolic',
                    points: const [78, 80, 76, 84, 82, 79, 81],
                    color: CustomColors.teal,
                    visible: visible.contains('dia'),
                  ),
                ],
                onToggleSeries: (String id) {
                  final Set<String> next = Set<String>.of(visible);
                  next.contains(id) ? next.remove(id) : next.add(id);
                  set(next);
                },
              ),
            );
          },
    ),
  ),
  widgetCode: r'''
import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// One data series of a [LineChart].
class ChartSeries {
  const ChartSeries({
    required this.id,
    required this.label,
    required this.points,
    required this.color,
    this.visible = true,
  });

  final String id;
  final String label;
  final List<double> points;
  final Color color;
  final bool visible;
}

/// Multi-series line chart drawn by hand. Tap a legend chip to hide or show
/// a series.
@docWidget
class LineChart extends StatelessWidget {
  const LineChart({
    required this.series,
    required this.labels,
    this.onToggleSeries,
    this.height = 180,
    this.hint,
    super.key,
  });

  final List<ChartSeries> series;
  final List<String> labels;

  /// Null makes the legend read-only.
  final ValueChanged<String>? onToggleSeries;

  final double height;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);
    final List<ChartSeries> visible = series
        .where((ChartSeries s) => s.visible)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Semantics(
          container: true,
          label: visible.isEmpty
              ? 'Empty chart'
              : visible
                    .where((ChartSeries s) => s.points.isNotEmpty)
                    .map((ChartSeries s) => '${s.label} ${s.points.last}')
                    .join(', '),
          child: SizedBox(
            height: height,
            width: double.infinity,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 1),
              duration: reduceMotion
                  ? Duration.zero
                  : const Duration(milliseconds: 650),
              curve: Curves.easeOutCubic,
              builder: (BuildContext context, double progress, Widget? child) =>
                  CustomPaint(
                    painter: _LinePainter(
                      series: visible,
                      labels: labels,
                      progress: progress,
                      textScaler: MediaQuery.textScalerOf(context),
                    ),
                  ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: <Widget>[
            for (final ChartSeries line in series)
              TouchableOpacity.scale(
                onTap: onToggleSeries == null
                    ? null
                    : () => onToggleSeries!(line.id),
                child: AnimatedOpacity(
                  duration: reduceMotion
                      ? Duration.zero
                      : const Duration(milliseconds: 180),
                  opacity: line.visible ? 1 : 0.45,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: line.visible
                          ? line.color.withValues(alpha: 0.12)
                          : CustomColors.neutral100,
                      borderRadius: BorderRadius.circular(99),
                      border: Border.all(
                        color: line.visible
                            ? line.color.withValues(alpha: 0.45)
                            : Colors.transparent,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            color: line.visible
                                ? line.color
                                : CustomColors.neutral400,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          line.label,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: line.visible
                                ? CustomColors.ink
                                : CustomColors.neutral500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (hint != null) ...<Widget>[
          const SizedBox(height: 8),
          Text(
            hint!,
            style: const TextStyle(
              fontSize: 11,
              color: CustomColors.neutral500,
            ),
          ),
        ],
      ],
    );
  }
}

class _LinePainter extends CustomPainter {
  const _LinePainter({
    required this.series,
    required this.labels,
    required this.progress,
    required this.textScaler,
  });

  final List<ChartSeries> series;
  final List<String> labels;
  final double progress;

  /// System font scale — axis labels must grow like any other text.
  final TextScaler textScaler;

  @override
  void paint(Canvas canvas, Size size) {
    if (labels.isEmpty) return;

    final Iterable<double> allPoints = series.expand(
      (ChartSeries s) => s.points,
    );
    final double maxY = allPoints.fold<double>(
      0,
      (double m, double v) => v > m ? v : m,
    );
    final double range = maxY <= 0 ? 1 : maxY;

    const double left = 8;
    final double right = size.width - 8;
    const double top = 12;
    final double bottom =
        size.height - math.max(24.0, textScaler.scale(10) * 1.4 + 8);
    final double chartW = right - left;
    final double chartH = bottom - top;
    final int n = labels.length;

    final Paint gridPaint = Paint()
      ..color = CustomColors.neutral200
      ..strokeWidth = 1;
    for (int i = 0; i <= 3; i++) {
      final double y = top + chartH * i / 3;
      canvas.drawLine(Offset(left, y), Offset(right, y), gridPaint);
    }

    final TextPainter labelPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
      textScaler: textScaler,
    );
    const TextStyle labelStyle = TextStyle(
      color: CustomColors.neutral500,
      fontSize: 10,
    );

    double widest = 0;
    for (final String label in labels) {
      labelPainter
        ..text = TextSpan(text: label, style: labelStyle)
        ..layout();
      widest = math.max(widest, labelPainter.width);
    }
    final double gap = n <= 1 ? chartW : chartW / (n - 1);
    final int step = (gap <= 0 || widest + 6 <= gap)
        ? 1
        : ((widest + 6) / gap).ceil();

    for (int i = 0; i < n; i += step) {
      final double x = n == 1 ? left : left + chartW * i / (n - 1);
      labelPainter
        ..text = TextSpan(text: labels[i], style: labelStyle)
        ..layout();
      final double maxDx = math.max(0, size.width - labelPainter.width);
      final double dx = (x - labelPainter.width / 2).clamp(0.0, maxDx);
      labelPainter.paint(canvas, Offset(dx, bottom + 6));
    }

    for (final ChartSeries line in series) {
      final List<double> points = line.points;
      if (points.isEmpty) continue;

      final Paint stroke = Paint()
        ..color = line.color
        ..strokeWidth = 2.4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;
      final Paint dot = Paint()..color = line.color;

      final Path path = Path();
      for (int i = 0; i < points.length; i++) {
        final double x = points.length == 1
            ? left
            : left + chartW * i / (points.length - 1);
        final double baseY = bottom - (points[i] / range) * chartH;
        final double y = bottom - (bottom - baseY) * progress;
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
        canvas.drawCircle(Offset(x, y), 3.2, dot);
      }
      canvas.drawPath(path, stroke);
    }
  }

  @override
  bool shouldRepaint(covariant _LinePainter old) =>
      old.series != series ||
      old.labels != labels ||
      old.progress != progress ||
      old.textScaler != textScaler;
}
  ''',
);
