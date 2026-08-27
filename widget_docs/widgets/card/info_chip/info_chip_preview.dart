import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/info_chip.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/info_chip.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = InfoChipDocWidget();

final infoChipPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Info Chip",
  description:
      "Small status chip whose background is its own colour at 12% opacity, so the text always keeps contrast against it. `compact` drops the padding for chips sitting inline within a line of text.",
  dependencies: _documentation.dependencies,
  code: r'''
InfoChip(
  label: 'Normal',
  color: CustomColors.success,
  icon: Icons.check_rounded,
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: const [
          InfoChip(
            label: 'Normal',
            color: CustomColors.success,
            icon: Icons.check_rounded,
          ),
          InfoChip(
            label: 'Watch closely',
            color: CustomColors.warning,
            icon: Icons.info_outline_rounded,
          ),
          InfoChip(label: 'Critical', color: CustomColors.error),
          InfoChip(label: 'New', color: CustomColors.info, compact: true),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Small info chip whose background is its main colour at 12% opacity.
@docWidget
class InfoChip extends StatelessWidget {
  const InfoChip({
    required this.label,
    required this.color,
    this.icon,
    this.compact = false,
    super.key,
  });

  final String label;
  final Color color;
  final IconData? icon;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 12,
        vertical: compact ? 3 : 6,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: compact ? 11 : 14, color: color),
            SizedBox(width: compact ? 4 : 5),
          ],
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w800,
              fontSize: compact ? 11 : 12,
            ),
          ),
        ],
      ),
    );
  }
}
  ''',
);
