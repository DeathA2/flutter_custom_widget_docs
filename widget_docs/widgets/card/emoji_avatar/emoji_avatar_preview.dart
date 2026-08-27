import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/emoji_avatar.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/emoji_avatar.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = EmojiAvatarDocWidget();

final emojiAvatarPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Emoji Avatar",
  description:
      "Round avatar holding an emoji, for members who have no photo yet. A null emoji falls back to a person icon rather than leaving an empty circle. It is its own widget rather than an inline `CircleAvatar` at each call site so the day real photos arrive there is one place to change.",
  dependencies: _documentation.dependencies,
  code: r'''
EmojiAvatar(emoji: '🐣', size: 48),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          EmojiAvatar(emoji: '🐣', size: 40),
          EmojiAvatar(emoji: '🦊', size: 56),
          EmojiAvatar(
            emoji: '🐨',
            size: 72,
            ringColor: CustomColors.teal,
            background: CustomColors.brandSoft,
          ),
          EmojiAvatar(emoji: null, size: 40),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Round avatar holding an emoji.
@docWidget
class EmojiAvatar extends StatelessWidget {
  const EmojiAvatar({
    required this.emoji,
    this.size = 40,
    this.ringColor,
    this.background,
    super.key,
  });

  final String? emoji;
  final double size;

  /// Drawn as a 2pt ring — a white outline for avatars sitting on coloured cards.
  final Color? ringColor;

  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: background ?? CustomColors.brand.withValues(alpha: 0.12),
        shape: BoxShape.circle,
        border: ringColor == null
            ? null
            : Border.all(color: ringColor!, width: 2),
      ),
      child: Text(
        (emoji == null || emoji!.isEmpty) ? '🙂' : emoji!,
        style: TextStyle(fontSize: size * 0.5, height: 1.1),
      ),
    );
  }
}
  ''',
);
