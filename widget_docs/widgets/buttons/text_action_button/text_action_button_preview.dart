import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/text_action_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/text_action_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = TextActionButtonDocWidget();

final textActionButtonPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Text Action Button",
  description:
      "Text button whose tap target stays at least 48pt even when the label is two characters long. The visible padding stays small; only the hit area grows, so it never becomes the \"button smaller than a fingertip\" that platform guidelines flag.",
  dependencies: _documentation.dependencies,
  code: r'''
TextActionButton(
  label: 'Add entry',
  icon: Icons.add_rounded,
  onTap: () {},
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextActionButton(
            label: 'Add entry',
            icon: Icons.add_rounded,
            onTap: () {},
          ),
          TextActionButton(label: 'See all', onTap: () {}),
          TextActionButton(
            label: 'Remove from list',
            icon: Icons.delete_outline_rounded,
            color: CustomColors.error,
            onTap: () {},
          ),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// Text button whose tap target stays at least 48pt even when the label is short.
@docWidget
class TextActionButton extends StatelessWidget {
  const TextActionButton({
    required this.label,
    required this.onTap,
    this.color = CustomColors.brand,
    this.icon,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      minSize: 48,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null) ...<Widget>[
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  ''',
);
