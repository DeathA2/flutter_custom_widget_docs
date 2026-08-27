import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/charts/donut_chart.dart';
import 'package:flutter_custom_widget_docs/widgets/charts/donut_chart.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = DonutChartDocWidget();

final donutChartPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Donut Chart",
  description:
      "Hand-painted donut with a label in the hole and a legend underneath — no charting package. `animationKey` decides when the sweep replays, and this is the right place for a replay: changing the subject or the reporting period is a whole new dataset, not the same number ticking up. The whole ring sits in a single `Semantics` node reading the total and each part, since a screen reader has no way to feel a canvas.",
  dependencies: _documentation.dependencies,
  code: r'''
DonutChart(
  slices: [
    DonutSlice(label: 'Done', percent: 62, color: CustomColors.success),
    DonutSlice(label: 'Left', percent: 38, color: CustomColors.warning),
  ],
  centerTitle: 'This week',
  centerValue: '62%',
  animationKey: 'week-42',
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: DonutChart(
        slices: const [
          DonutSlice(label: 'Done', percent: 52, color: CustomColors.success),
          DonutSlice(
            label: 'In progress',
            percent: 28,
            color: CustomColors.info,
          ),
          DonutSlice(label: 'Missed', percent: 20, color: CustomColors.error),
        ],
        centerTitle: 'This week',
        centerValue: '52%',
        animationKey: 'week-42',
        size: 170,
      ),
    ),
  ),
  widgetCode: r'''
import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// One slice of a [DonutChart].
class DonutSlice {
  const DonutSlice({
    required this.label,
    required this.percent,
    required this.color,
  });

  final String label;

  /// 0..100.
  final double percent;

  final Color color;
}

/// Donut chart drawn by hand with `CustomPainter`.
@docWidget
class DonutChart extends StatelessWidget {
  const DonutChart({
    required this.slices,
    required this.centerTitle,
    required this.centerValue,
    required this.animationKey,
    this.size = 190,
    this.trackColor = CustomColors.neutral200,
    super.key,
  });

  final List<DonutSlice> slices;
  final String centerTitle;
  final String centerValue;
  final Object animationKey;
  final double size;
  final Color trackColor;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      container: true,
      label:
          '$centerTitle $centerValue. '
          '${slices.map((DonutSlice s) => '${s.label} ${s.percent.round()}%').join(', ')}',
      child: SizedBox(
        width: size,
        height: size,
        child: TweenAnimationBuilder<double>(
          key: ValueKey<Object>(animationKey),
          tween: Tween<double>(begin: 0, end: 1),
          duration: reduceMotion
              ? Duration.zero
              : const Duration(milliseconds: 900),
          curve: Curves.easeOutCubic,
          builder: (BuildContext context, double progress, Widget? child) {
            return CustomPaint(
              painter: _DonutPainter(
                slices: slices,
                progress: progress,
                trackColor: trackColor,
              ),
              child: child,
            );
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  centerTitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CustomColors.neutral500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  centerValue,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: CustomColors.ink,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DonutPainter extends CustomPainter {
  const _DonutPainter({
    required this.slices,
    required this.progress,
    required this.trackColor,
  });

  final List<DonutSlice> slices;
  final double progress;
  final Color trackColor;

  static const double _stroke = 24;

  /// Gap between two slices, in radians.
  static const double _gap = 0.035;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = (math.min(size.width, size.height) - _stroke) / 2;
    final Offset centre = size.center(Offset.zero);
    final Rect rect = Rect.fromCircle(center: centre, radius: radius);

    canvas.drawCircle(
      centre,
      radius,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = _stroke,
    );

    final List<DonutSlice> visible = slices
        .where((DonutSlice s) => s.percent > 0)
        .toList();
    if (visible.isEmpty) return;

    double start = -math.pi / 2;
    for (final DonutSlice slice in visible) {
      final double full = slice.percent / 100 * math.pi * 2;
      final double sweep = (full - _gap) * progress;
      if (sweep > 0) {
        canvas.drawArc(
          rect,
          start,
          sweep,
          false,
          Paint()
            ..color = slice.color
            ..style = PaintingStyle.stroke
            ..strokeWidth = _stroke
            ..strokeCap = StrokeCap.round,
        );
      }
      start += full;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutPainter old) =>
      old.progress != progress ||
      old.trackColor != trackColor ||
      old.slices != slices;
}
  ''',
);
