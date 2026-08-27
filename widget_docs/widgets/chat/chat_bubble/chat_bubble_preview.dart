import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/chat_bubble.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/chat_bubble.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/day_divider_pill.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = ChatBubbleDocWidget();

final chatBubblePreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Chat Bubble",
  description:
      "Own and other messages, grouped into runs: only the first message of a run shows the sender name, and the avatar column is *reserved* on the rest rather than removed, so the bubbles stay aligned instead of sliding left. Only text needs a filled bubble — stickers, images and GIFs sit bare on the room background with the timestamp underneath, because a sticker on a coloured bubble reads as a rendering fault. `animateIn` belongs only on the newest message; replaying the whole list on every rebuild flickers the entire screen.",
  dependencies: _documentation.dependencies,
  code: r'''
ChatBubble(
  isOwn: false,
  startsRun: true,
  timeLabel: '09:41',
  text: 'Hi there!',
  senderName: 'Alex',
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: const [
          DayDividerPill(label: 'Today'),
          SizedBox(height: 8),
          ChatBubble(
            isOwn: false,
            startsRun: true,
            timeLabel: '09:41',
            senderName: 'Alex',
            senderEmoji: '🦊',
            text: 'Morning! How did your reading go today?',
          ),
          ChatBubble(
            isOwn: false,
            startsRun: false,
            timeLabel: '09:41',
            text: 'Happy to take a look.',
          ),
          ChatBubble(
            isOwn: true,
            startsRun: true,
            timeLabel: '09:43',
            text: '120/80 — much better than yesterday!',
            status: MessageStatus.seen,
            reactions: {'👍': 2},
          ),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/bubble_enter.dart';

/// Delivery state of a message — decides the tick icon.
enum MessageStatus {
  sending(Icons.schedule_rounded),
  sent(Icons.check_rounded),
  delivered(Icons.done_all_rounded),
  seen(Icons.done_all_rounded),
  failed(Icons.error_outline_rounded);

  const MessageStatus(this.icon);

  final IconData icon;
}

/// Chat message bubble, with an avatar and sender name when it opens a run.
@docWidget
class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.isOwn,
    required this.startsRun,
    required this.timeLabel,
    this.text,
    this.media,
    this.senderName,
    this.senderEmoji = '🙂',
    this.status,
    this.animateIn = false,
    this.reactions = const <String, int>{},
    this.onLongPress,
    this.ownColor = CustomColors.brand,
    this.otherColor = CustomColors.neutral100,
    this.avatarSize = 32,
    this.bubbleRadius = 18,
    super.key,
  });

  final bool isOwn;

  /// First message of a run by the same sender — shows the name and avatar.
  final bool startsRun;

  final String timeLabel;

  /// Text content. Null when this is a media message.
  final String? text;

  /// Sticker, image or GIF. When set, [text] is ignored and the bubble has no
  /// background.
  final Widget? media;

  final String? senderName;
  final String senderEmoji;

  /// Ticks only appear on your own messages.
  final MessageStatus? status;

  final bool animateIn;

  /// emoji to reaction count. Empty draws no chips.
  final Map<String, int> reactions;

  /// Null disables long press entirely.
  final VoidCallback? onLongPress;

  final Color ownColor;
  final Color otherColor;
  final double avatarSize;
  final double bubbleRadius;

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.sizeOf(context).width * 0.72;
    final bool chromed = media == null;

    final Color metaColor = isOwn && chromed
        ? CustomColors.white.withValues(alpha: 0.8)
        : CustomColors.neutral500;
    final Color tickColor = status == MessageStatus.seen && isOwn
        ? (chromed ? CustomColors.white : ownColor)
        : status == MessageStatus.failed
        ? CustomColors.error
        : metaColor;

    final Widget meta = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(timeLabel, style: TextStyle(fontSize: 11, color: metaColor)),
        if (isOwn && status != null) ...<Widget>[
          const SizedBox(width: 4),
          Icon(status!.icon, size: 14, color: tickColor),
        ],
      ],
    );

    final bool showChips = reactions.isNotEmpty;

    const double chipHeight = 22;
    const double overhang = chipHeight * 0.5;

    final double reserve = showChips ? (chipHeight - overhang) + 6 : 0.0;

    Widget payload = media != null
        ? _BareContent(
            isOwn: isOwn,
            meta: meta,
            extraBottom: reserve,
            child: media!,
          )
        : _TextBubble(
            text: text ?? '',
            meta: meta,
            isOwn: isOwn,
            radius: bubbleRadius,
            fill: isOwn ? ownColor : otherColor,
            textColor: isOwn ? CustomColors.white : CustomColors.ink,
            extraBottom: reserve,
          );

    if (onLongPress != null) {
      payload = GestureDetector(
        behavior: HitTestBehavior.opaque,
        onLongPress: onLongPress,
        child: Semantics(onLongPressHint: 'React', child: payload),
      );
    }

    if (showChips) {
      payload = Stack(
        alignment: isOwn
            ? AlignmentDirectional.bottomEnd
            : AlignmentDirectional.bottomStart,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: overhang),
            child: payload,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: isOwn ? 0 : 10,
              right: isOwn ? 10 : 0,
            ),
            child: _ReactionChips(reactions: reactions, height: chipHeight),
          ),
        ],
      );
    }

    final Widget column = Column(
      crossAxisAlignment: isOwn
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: <Widget>[
        if (startsRun && !isOwn && senderName != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4, left: 4),
            child: Text(
              senderName!,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: CustomColors.neutral500,
              ),
            ),
          ),
        payload,
      ],
    );

    final Widget row = Row(
      mainAxisAlignment: isOwn
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        if (!isOwn) ...<Widget>[
          _AvatarSlot(emoji: senderEmoji, size: avatarSize, visible: startsRun),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: column,
          ),
        ),
      ],
    );

    final Widget merged = MergeSemantics(child: row);

    if (!animateIn) return merged;
    return BubbleEnter(child: merged);
  }
}

/// Bubble with a background, timestamp tucked inside it.
class _TextBubble extends StatelessWidget {
  const _TextBubble({
    required this.text,
    required this.meta,
    required this.isOwn,
    required this.radius,
    required this.fill,
    required this.textColor,
    this.extraBottom = 0,
  });

  final String text;
  final Widget meta;
  final bool isOwn;
  final double radius;
  final Color fill;
  final Color textColor;

  /// Room bought back for the reaction chips to overlap the bubble, so the
  /// timestamp is not what they land on.
  final double extraBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 9, 14, 7 + extraBottom),
      decoration: BoxDecoration(
        color: fill,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
          bottomLeft: Radius.circular(isOwn ? radius : 6),
          bottomRight: Radius.circular(isOwn ? 6 : radius),
        ),
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 15, height: 1.35, color: textColor),
            ),
            const SizedBox(height: 2),
            Align(alignment: Alignment.centerRight, child: meta),
          ],
        ),
      ),
    );
  }
}

/// Sticker, image or GIF: no background, no padding, time underneath.
class _BareContent extends StatelessWidget {
  const _BareContent({
    required this.isOwn,
    required this.meta,
    required this.child,
    this.extraBottom = 0,
  });

  final bool isOwn;
  final Widget meta;
  final Widget child;

  /// The same reserve as the text bubble, and it matters more here: the
  /// timestamp is last in the column, with nothing below it.
  final double extraBottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: extraBottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: isOwn
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: <Widget>[
          child,
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: meta,
          ),
        ],
      ),
    );
  }
}

/// Fixed-width avatar column — keeps bubbles aligned when the avatar is hidden
/// mid-run, instead of letting the row slide left.
class _AvatarSlot extends StatelessWidget {
  const _AvatarSlot({
    required this.emoji,
    required this.size,
    required this.visible,
  });

  final String emoji;
  final double size;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) return SizedBox(width: size);
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: CustomColors.neutral100,
        shape: BoxShape.circle,
      ),
      child: Text(emoji, style: TextStyle(fontSize: size * 0.55)),
    );
  }
}

class _ReactionChips extends StatelessWidget {
  const _ReactionChips({required this.reactions, required this.height});

  final Map<String, int> reactions;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (final MapEntry<String, int> entry in reactions.entries)
          Container(
            height: height,
            margin: const EdgeInsets.only(right: 4),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
              color: CustomColors.white,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: CustomColors.neutral200),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(entry.key, style: const TextStyle(fontSize: 12)),
                if (entry.value > 1) ...<Widget>[
                  const SizedBox(width: 3),
                  Text(
                    '${entry.value}',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.neutral700,
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
  ''',
);
