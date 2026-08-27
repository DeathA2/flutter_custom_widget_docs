import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/gradient_progress_card.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/gradient_progress_card.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = GradientProgressCardDocWidget();

final gradientProgressCardPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Gradient Progress Card",
  description:
      "Gradient card summarising a goal: title, item count, progress bar and a status line. Text stays white because the background is a fixed dark gradient rather than a theme colour. Count the whole list here, never the filtered view — progress is a fact about the work, and a bar that jumps when someone types in a search box is reporting on the UI instead.",
  dependencies: _documentation.dependencies,
  code: r'''
GradientProgressCard(
  title: 'This week',
  countLabel: '5 of 8 tasks',
  progress: 0.62,
  statusLabel: 'Almost there!',
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: const GradientProgressCard(
        title: 'This week',
        countLabel: '5 of 8 tasks',
        progress: 0.62,
        statusLabel: 'Almost there, keep going!',
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Default background gradient of the card.
const List<Color> _kDefaultGradient = <Color>[
  CustomColors.brand,
  CustomColors.brandDark,
];

/// Gradient card with a progress bar — "3 of 8 bought", "5 of 12 done".
@docWidget
class GradientProgressCard extends StatelessWidget {
  const GradientProgressCard({
    required this.title,
    required this.countLabel,
    required this.progress,
    required this.statusLabel,
    this.gradientColors,
    this.barColor = CustomColors.reward,
    super.key,
  });

  final String title;
  final String countLabel;

  /// 0..1, the caller has already guarded against dividing by zero.
  final double progress;

  final String statusLabel;

  /// Background gradient. Null uses the darkening brand tones.
  final List<Color>? gradientColors;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors ?? _kDefaultGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        color: CustomColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      countLabel,
                      style: const TextStyle(
                        fontSize: 16,
                        color: CustomColors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.white.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  statusLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    color: CustomColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progress.clamp(0.0, 1.0)),
              duration: reduceMotion
                  ? Duration.zero
                  : const Duration(milliseconds: 420),
              curve: Curves.easeOutCubic,
              builder: (BuildContext context, double value, Widget? child) =>
                  LinearProgressIndicator(
                    value: value,
                    minHeight: 8,
                    backgroundColor: Colors.black.withValues(alpha: 0.22),
                    valueColor: AlwaysStoppedAnimation<Color>(barColor),
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
