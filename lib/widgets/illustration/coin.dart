import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Hand-drawn coin.
@docWidget
class Coin extends StatelessWidget {
  const Coin({
    this.size = 44,
    this.lifted = false,
    this.color = CustomColors.gold,
    super.key,
  });

  final double size;
  final bool lifted;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _CoinPainter(lifted: lifted, color: color),
      ),
    );
  }
}

class _CoinPainter extends CustomPainter {
  const _CoinPainter({required this.lifted, required this.color});

  final bool lifted;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = size.center(Offset.zero);
    final double r = size.width * 0.38;

    if (lifted) {
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(c.dx, size.height * 0.86),
          width: size.width * 0.55,
          height: size.height * 0.16,
        ),
        Paint()..color = Colors.black.withValues(alpha: 0.18),
      );
    }

    canvas.drawCircle(c, r, Paint()..color = color);
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..color = Color.lerp(color, CustomColors.white, 0.45)!
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    canvas.drawCircle(
      Offset(c.dx + size.width * 0.12, c.dy - size.height * 0.1),
      size.width * 0.05,
      Paint()..color = CustomColors.white.withValues(alpha: 0.9),
    );
  }

  @override
  bool shouldRepaint(covariant _CoinPainter old) =>
      old.lifted != lifted || old.color != color;
}
