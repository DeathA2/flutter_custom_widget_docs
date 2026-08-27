import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/page_indicator.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/page_indicator.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = PageIndicatorDocWidget();

final pageIndicatorPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Page Indicator",
  description:
      "Dots for onboarding and carousels. The active dot stretches into a bar rather than only changing colour, so the current page is readable even when the two colours are not distinguishable to the viewer.",
  dependencies: _documentation.dependencies,
  code: r'''
PageIndicator(count: 4, currentIndex: 1),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<int>(
      initial: 1,
      builder: (BuildContext context, int value, ValueChanged<int> set) =>
          DemoSurface(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PageIndicator(count: 4, currentIndex: value),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => set((value - 1).clamp(0, 3)),
                      icon: const Icon(Icons.chevron_left_rounded),
                    ),
                    IconButton(
                      onPressed: () => set((value + 1).clamp(0, 3)),
                      icon: const Icon(Icons.chevron_right_rounded),
                    ),
                  ],
                ),
              ],
            ),
          ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Page indicator for onboarding and carousels: the active dot stretches into
/// a bar.
@docWidget
class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.count,
    required this.currentIndex,
    this.activeColor = CustomColors.brand,
    this.inactiveColor = CustomColors.neutral200,
    super.key,
  });

  final int count;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    return Semantics(
      label: 'Page ${currentIndex + 1} of $count',
      excludeSemantics: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(count, (int index) {
          final bool isActive = index == currentIndex;
          return AnimatedContainer(
            duration: reduceMotion
                ? Duration.zero
                : const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: isActive ? 28 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }
}
  ''',
);
