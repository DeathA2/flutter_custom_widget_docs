import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/surface_card.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/surface_card.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = SurfaceCardDocWidget();

final surfaceCardPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Surface Card",
  description:
      "The default container: white background, hairline border, radius 18. Pass `onTap` and it wraps itself in press feedback; leave it null and it builds no gesture detector at all, because a wrapper that reacts to a press but does nothing is a promise the UI cannot keep.",
  dependencies: _documentation.dependencies,
  code: r'''
SurfaceCard(
  onTap: () {},
  child: const Text('Any content'),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SurfaceCard(
            onTap: () {},
            child: const Text('Tappable card — press it to see it shrink'),
          ),
          const SizedBox(height: 12),
          const SurfaceCard(
            radius: 20,
            background: CustomColors.brandTint,
            borderColor: CustomColors.brandSoft,
            child: Text('Static card with a custom background and radius'),
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

/// Base card: white background, hairline border, radius 18.
@docWidget
class SurfaceCard extends StatelessWidget {
  const SurfaceCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderColor = CustomColors.neutral200,
    this.background = CustomColors.white,
    this.radius = 18,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Color background;
  final double radius;

  /// Null leaves the card non-tappable, with no press feedback wrapper around it.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Widget box = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );

    return onTap == null
        ? box
        : TouchableOpacity.scale(onTap: onTap, child: box);
  }
}
  ''',
);
