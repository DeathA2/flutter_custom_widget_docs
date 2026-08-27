import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';
import '../../preview/manual_documentation.dart';

final _documentation = ManualDocumentation(
  name: 'DragAutoScroll',
  properties: [
    PropertyDoc(
      name: 'controller',
      type: 'ScrollController',
      isRequired: true,
      isNamed: true,
      description: 'Controller of the list that should scroll.',
    ),
    PropertyDoc(
      name: 'globalY',
      type: 'double',
      isRequired: true,
      isNamed: true,
      description:
          'Global pointer position (globalX for the horizontal variant).',
    ),
    PropertyDoc(
      name: 'viewportTop',
      type: 'double',
      isRequired: true,
      isNamed: true,
      description: 'Top edge of the viewport, in global coordinates.',
    ),
    PropertyDoc(
      name: 'viewportHeight',
      type: 'double',
      isRequired: true,
      isNamed: true,
    ),
    PropertyDoc(
      name: 'edge',
      type: 'double',
      isRequired: false,
      isNamed: true,
      defaultValue: '72',
      description: 'Thickness of the edge band that triggers scrolling.',
    ),
    PropertyDoc(
      name: 'maxStep',
      type: 'double',
      isRequired: false,
      isNamed: true,
      defaultValue: '18',
      description: 'Maximum pixels scrolled per call.',
    ),
  ],
);

final dragAutoScrollPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Drag Auto Scroll",
  description:
      "Auto-scrolls while a drag nears the edge of a list — what `ReorderableListView` gives you for free and every hand-written drag has to add. Without it the user must drop the item, scroll, and pick it up again. It uses `jumpTo` rather than `animateTo`: each call is one small step driven by `onDragUpdate`, so the sequence of steps *is* the animation, whereas `animateTo` would stack dozens of competing animations per second. Scroll speed ramps up the deeper the pointer goes into the edge band.",
  dependencies: _documentation.dependencies,
  code: r'''
DragAutoScroll.vertical(
  controller: scrollController,
  globalY: dragPosition.dy,
  viewportTop: box.localToGlobal(Offset.zero).dy,
  viewportHeight: box.size.height,
);
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.swap_vert_rounded, size: 40, color: CustomColors.brand),
          SizedBox(height: 12),
          Text(
            'A static API — nothing to render.',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8),
          Text(
            'Call it from onPointerMove / onDragUpdate, passing the '
            'ScrollController along with the pointer position and the viewport. '
            'See the source below for the full parameter list.',
            style: TextStyle(fontSize: 13, color: CustomColors.neutral500),
          ),
        ],
      ),
    ),
  ),
  widgetCode: r'''
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
  ''',
);
