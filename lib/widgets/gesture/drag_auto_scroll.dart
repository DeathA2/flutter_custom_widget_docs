import 'package:flutter/material.dart';

/// Auto-scrolls while a drag nears the edge — plain functions, not a widget.
abstract final class DragAutoScroll {
  /// Scrolls vertically while the pointer enters the top or bottom edge band of
  /// [listKey]. [navClearance] is the height of the floating nav bar covering the
  /// bottom, so the usable "bottom" edge sits that much higher.
  static void vertical({
    required ScrollController controller,
    required GlobalKey listKey,
    required Offset globalPosition,
    double edgeZone = 110,
    double navClearance = 96,
  }) {
    if (!controller.hasClients) return;
    final RenderObject? object = listKey.currentContext?.findRenderObject();
    if (object is! RenderBox || !object.hasSize) return;

    final Offset local = object.globalToLocal(globalPosition);
    final double height = object.size.height;
    final double max = controller.position.maxScrollExtent;
    double delta = 0;

    final double bottomEdge = height - navClearance;
    if (local.dy > bottomEdge - edgeZone) {
      final double t = ((local.dy - (bottomEdge - edgeZone)) / edgeZone).clamp(
        0.0,
        1.0,
      );
      delta = 10 + 22 * t;
    } else if (local.dy < edgeZone) {
      final double t = (1 - local.dy / edgeZone).clamp(0.0, 1.0);
      delta = -(10 + 22 * t);
    }

    if (delta == 0) return;
    final double offset = (controller.offset + delta).clamp(0.0, max);
    if ((offset - controller.offset).abs() > 0.5) controller.jumpTo(offset);
  }

  /// Scrolls horizontally while the pointer enters the left or right edge band
  /// of [stripKey].
  static void horizontal({
    required ScrollController controller,
    required GlobalKey stripKey,
    required Offset globalPosition,
    double edgeZone = 72,
    double verticalTolerance = 48,
  }) {
    if (!controller.hasClients) return;
    final RenderObject? object = stripKey.currentContext?.findRenderObject();
    if (object is! RenderBox || !object.hasSize) return;

    final Offset local = object.globalToLocal(globalPosition);
    if (local.dy < -verticalTolerance ||
        local.dy > object.size.height + verticalTolerance) {
      return;
    }

    final double width = object.size.width;
    double delta = 0;
    if (local.dx > width - edgeZone) {
      final double t = ((local.dx - (width - edgeZone)) / edgeZone).clamp(
        0.0,
        1.0,
      );
      delta = 14 + 28 * t;
    } else if (local.dx < edgeZone) {
      final double t = (1 - local.dx / edgeZone).clamp(0.0, 1.0);
      delta = -(14 + 28 * t);
    }

    if (delta == 0) return;
    final double max = controller.position.maxScrollExtent;
    final double offset = (controller.offset + delta).clamp(0.0, max);
    if ((offset - controller.offset).abs() > 0.5) controller.jumpTo(offset);
  }
}
