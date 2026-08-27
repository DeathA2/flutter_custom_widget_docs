import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/count_badge.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/count_badge.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = CountBadgeDocWidget();

final countBadgePreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Count Badge",
  description:
      "Red count badge meant to sit over an icon inside a `Stack`. It disappears on its own when the count drops to zero, so call sites need no `if` around it. Past 99 it shows \"99+\", and any badge wider than one digit turns from a circle into a pill so the number is not cramped.",
  dependencies: _documentation.dependencies,
  code: r'''
CountBadge(count: 12),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CountBadge(count: 3),
          CountBadge(count: 12),
          CountBadge(count: 240),
          CountBadge(count: 7, compact: true),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Red count badge, meant to sit over an icon inside a `Stack`.
@docWidget
class CountBadge extends StatelessWidget {
  const CountBadge({
    required this.count,
    this.compact = false,
    this.color = CustomColors.error,
    super.key,
  });

  final int count;
  final bool compact;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();

    final String label = count > 99 ? '99+' : '$count';
    final double size = compact ? 16 : 18;
    final bool isWide = label.length > 1;

    return Container(
      width: isWide ? null : size,
      height: size,
      constraints: BoxConstraints(minWidth: size, minHeight: size),
      padding: EdgeInsets.symmetric(horizontal: isWide ? (compact ? 4 : 5) : 0),
      decoration: BoxDecoration(
        color: color,
        shape: isWide ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isWide ? BorderRadius.circular(999) : null,
        border: Border.all(color: CustomColors.white, width: 1.5),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: CustomColors.white,
          fontSize: compact ? 9 : 10,
          fontWeight: FontWeight.w800,
          height: 1,
        ),
      ),
    );
  }
}
  ''',
);
