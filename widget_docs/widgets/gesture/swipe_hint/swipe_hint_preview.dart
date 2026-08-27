import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/gesture/swipe_hint.dart';
import 'package:flutter_custom_widget_docs/widgets/gesture/swipe_hint.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = SwipeHintDocWidget();

final swipeHintPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Swipe Hint",
  description:
      "One line telling the reader a swipe exists. Swipe-to-reveal has no affordance of its own — nothing on screen suggests the row moves — so a screen that hides all its destructive actions behind that gesture needs to say so once, quietly, at the top. It is a filled chip rather than loose grey text, which at body size on a coloured background reads as a second subtitle competing with the real one. The arrow points the way the gesture goes.",
  dependencies: _documentation.dependencies,
  code: r'''
SwipeHint(text: 'Swipe left to edit or delete'),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SwipeHint(text: 'Swipe left to edit or delete'),
          SizedBox(height: 12),
          SwipeHint(
            text: 'Swipe right to mark as done',
            icon: Icons.keyboard_double_arrow_right_rounded,
          ),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// One line telling the reader a swipe gesture exists.
@docWidget
class SwipeHint extends StatelessWidget {
  const SwipeHint({
    required this.text,
    this.icon = Icons.keyboard_double_arrow_left_rounded,
    super.key,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: CustomColors.white.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: CustomColors.neutral200),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 16, color: CustomColors.neutral500),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  color: CustomColors.neutral500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  ''',
);
