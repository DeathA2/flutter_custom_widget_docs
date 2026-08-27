import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// What is drawn inside a [JarVisual].
enum JarContent { coins, plain, plant, hearts, book }

/// Glass jar with a fill level — the central metaphor of the savings feature.
@docWidget
class JarVisual extends StatelessWidget {
  const JarVisual({
    required this.accent,
    this.content = JarContent.coins,
    this.size = 72,
    this.fill = 0.45,
    super.key,
  });

  final Color accent;
  final JarContent content;
  final double size;
  final double fill;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _JarPainter(accent: accent, content: content, fill: fill),
      ),
    );
  }
}

class _JarPainter extends CustomPainter {
  const _JarPainter({
    required this.accent,
    required this.content,
    required this.fill,
  });

  final Color accent;
  final JarContent content;
  final double fill;

  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;

    final RRect jar = RRect.fromRectAndRadius(
      Rect.fromLTWH(w * 0.2, h * 0.18, w * 0.6, h * 0.72),
      Radius.circular(w * 0.14),
    );

    canvas
      ..drawRRect(jar, Paint()..color = accent.withValues(alpha: 0.12))
      ..drawRRect(
        jar,
        Paint()
          ..color = accent.withValues(alpha: 0.55)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.8,
      );

    final double fillH = h * 0.72 * fill.clamp(0.15, 0.85);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.24, h * 0.18 + h * 0.72 - fillH, w * 0.52, fillH),
        Radius.circular(w * 0.1),
      ),
      Paint()..color = accent.withValues(alpha: 0.35),
    );

    _paintContent(canvas, w, h);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(w * 0.3, h * 0.1, w * 0.4, h * 0.1),
        Radius.circular(w * 0.03),
      ),
      Paint()..color = accent.withValues(alpha: 0.75),
    );

    canvas.drawOval(
      Rect.fromLTWH(w * 0.27, h * 0.3, w * 0.06, h * 0.3),
      Paint()..color = CustomColors.white.withValues(alpha: 0.45),
    );
  }

  void _paintContent(Canvas canvas, double w, double h) {
    switch (content) {
      case JarContent.plain:
        break;

      case JarContent.coins:
        final Paint coin = Paint()..color = CustomColors.gold;
        for (int i = 0; i < 3; i++) {
          canvas.drawOval(
            Rect.fromCenter(
              center: Offset(w * 0.5, h * (0.7 - i * 0.1)),
              width: w * 0.34,
              height: h * 0.08,
            ),
            coin,
          );
        }

      case JarContent.plant:
        canvas
          ..drawLine(
            Offset(w * 0.5, h * 0.72),
            Offset(w * 0.5, h * 0.38),
            Paint()
              ..color = accent
              ..strokeWidth = 2
              ..strokeCap = StrokeCap.round
              ..style = PaintingStyle.stroke,
          )
          ..drawOval(
            Rect.fromCenter(
              center: Offset(w * 0.38, h * 0.42),
              width: w * 0.18,
              height: h * 0.1,
            ),
            Paint()..color = accent,
          )
          ..drawOval(
            Rect.fromCenter(
              center: Offset(w * 0.62, h * 0.36),
              width: w * 0.18,
              height: h * 0.1,
            ),
            Paint()..color = accent.withValues(alpha: 0.85),
          );

      case JarContent.hearts:
        void heart(Offset o, double s) {
          final Path p = Path()
            ..moveTo(o.dx, o.dy + s * 0.35)
            ..cubicTo(
              o.dx - s * 0.55,
              o.dy,
              o.dx - s * 0.45,
              o.dy - s * 0.55,
              o.dx,
              o.dy - s * 0.15,
            )
            ..cubicTo(
              o.dx + s * 0.45,
              o.dy - s * 0.55,
              o.dx + s * 0.55,
              o.dy,
              o.dx,
              o.dy + s * 0.35,
            );
          canvas.drawPath(p, Paint()..color = accent);
        }

        heart(Offset(w * 0.5, h * 0.52), w * 0.14);
        heart(Offset(w * 0.36, h * 0.62), w * 0.09);
        heart(Offset(w * 0.64, h * 0.6), w * 0.09);

      case JarContent.book:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: Offset(w * 0.5, h * 0.58),
              width: w * 0.34,
              height: h * 0.22,
            ),
            Radius.circular(w * 0.04),
          ),
          Paint()..color = accent.withValues(alpha: 0.85),
        );
        canvas.drawPath(
          Path()
            ..moveTo(w * 0.32, h * 0.42)
            ..lineTo(w * 0.5, h * 0.32)
            ..lineTo(w * 0.68, h * 0.42)
            ..close(),
          Paint()..color = accent,
        );
    }
  }

  @override
  bool shouldRepaint(covariant _JarPainter old) =>
      old.accent != accent || old.content != content || old.fill != fill;
}
