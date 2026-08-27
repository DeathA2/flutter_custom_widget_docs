import 'package:doc_widget/doc_widget.dart';

import 'chat_bubble/chat_bubble_preview.dart';
import 'bubble_enter/bubble_enter_preview.dart';
import 'reaction_bar/reaction_bar_preview.dart';
import 'day_divider_pill/day_divider_pill_preview.dart';

ElementsSection renderChatSection() {
  return ElementsSection(
    elements: [
      chatBubblePreview,
      bubbleEnterPreview,
      reactionBarPreview,
      dayDividerPillPreview,
    ],
    title: 'Chat',
  );
}
