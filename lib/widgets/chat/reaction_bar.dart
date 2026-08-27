import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/bubble_enter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// Emoji bar that a long press raises over a message.
Future<String?> showReactionBar({
  required BuildContext context,
  required Rect anchor,
  List<String> choices = const <String>['❤️', '😂', '😮', '😢', '👍', '🎉'],
  double tileSize = 44,
}) {
  return showDialog<String>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: 0.12),
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    builder: (BuildContext dialogContext) =>
        _ReactionBarLayer(anchor: anchor, choices: choices, tileSize: tileSize),
  );
}

class _ReactionBarLayer extends StatelessWidget {
  const _ReactionBarLayer({
    required this.anchor,
    required this.choices,
    required this.tileSize,
  });

  final Rect anchor;
  final List<String> choices;
  final double tileSize;

  static const double _gap = 8;
  static const double _padding = 6;
  static const double _edgeInset = 12;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.sizeOf(context);
    final double safeTop = MediaQuery.paddingOf(context).top;
    final int count = choices.length;
    final double barWidth = count * tileSize + _padding * 2 + (count - 1) * 4;
    final double barHeight = tileSize + _padding * 2;

    double top = anchor.top - barHeight - _gap;
    if (top < safeTop + _edgeInset) top = anchor.bottom + _gap;

    final double maxLeft = screen.width - barWidth - _edgeInset;
    final double left = maxLeft <= _edgeInset
        ? _edgeInset
        : (anchor.center.dx - barWidth / 2).clamp(_edgeInset, maxLeft);

    return Stack(
      children: <Widget>[
        Positioned(
          left: left,
          top: top,
          width: barWidth,
          height: barHeight,
          child: ReactionBar(choices: choices, tileSize: tileSize),
        ),
      ],
    );
  }
}

@docWidget
class ReactionBar extends StatelessWidget {
  const ReactionBar({required this.choices, required this.tileSize, super.key});

  final List<String> choices;
  final double tileSize;

  @override
  Widget build(BuildContext context) {
    return BubbleEnter(
      child: Material(
        color: CustomColors.white,
        elevation: 6,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.all(_ReactionBarLayer._padding),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (final String emoji in choices)
                TouchableOpacity.scale(
                  pressedScale: 0.82,
                  isButton: true,
                  semanticsLabel: 'React with $emoji',
                  onTap: () {
                    HapticFeedback.selectionClick();
                    Navigator.of(context).pop(emoji);
                  },
                  child: SizedBox(
                    width: tileSize,
                    height: tileSize,
                    child: Center(
                      child: Text(
                        emoji,
                        style: TextStyle(fontSize: tileSize * 0.56),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
