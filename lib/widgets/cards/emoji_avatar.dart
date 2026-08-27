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
