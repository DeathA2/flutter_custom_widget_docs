import 'package:doc_widget/doc_widget.dart';

import 'swipe_actions/swipe_actions_preview.dart';
import 'swipe_hint/swipe_hint_preview.dart';
import 'drag_auto_scroll/drag_auto_scroll_preview.dart';

ElementsSection renderGestureSection() {
  return ElementsSection(
    elements: [swipeActionsPreview, swipeHintPreview, dragAutoScrollPreview],
    title: 'Gestures',
  );
}
