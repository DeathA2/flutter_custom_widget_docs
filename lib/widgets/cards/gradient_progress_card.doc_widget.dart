// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class GradientProgressCardDocWidget implements Documentation {
  @override
  String get name => 'GradientProgressCard';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'title', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'countLabel',
      isRequired: true,
      isNamed: true,
      type: 'String',
    ),
    PropertyDoc(
      name: 'progress',
      isRequired: true,
      isNamed: true,
      type: 'double',
      description:
          '0..1, the caller has already guarded against dividing by zero.',
    ),
    PropertyDoc(
      name: 'statusLabel',
      isRequired: true,
      isNamed: true,
      type: 'String',
    ),
    PropertyDoc(
      name: 'gradientColors',
      isRequired: false,
      isNamed: true,
      type: 'List<Color>?',
      description: 'Background gradient. Null uses the darkening brand tones.',
    ),
    PropertyDoc(
      name: 'barColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.reward',
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
''';
}
