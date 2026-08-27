import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/skeleton_box.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/skeleton_box.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = SkeletonBoxDocWidget();

final skeletonBoxPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Skeleton Box",
  description:
      "A rounded grey block standing in for content that has not arrived. Leave `width` null and it takes the full width the parent offers, which is what a loading line of text wants. Group several inside one `Shimmer` so the whole set lights up in phase — nesting a shimmer per box puts them out of phase and reads as a rendering bug.",
  dependencies: _documentation.dependencies,
  code: r'''
SkeletonBox(width: 120, height: 12),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          SkeletonBox(width: 64, height: 64, radius: 32),
          SizedBox(height: 16),
          SkeletonBox(height: 14),
          SizedBox(height: 8),
          SkeletonBox(width: 180, height: 14),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/shimmer.dart';

/// One skeleton block. Group several inside a single [Shimmer] so the whole
/// set lights up in phase.
@docWidget
class SkeletonBox extends StatelessWidget {
  const SkeletonBox({this.width, this.height = 14, this.radius = 8, super.key});

  final double? width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: CustomColors.neutral200,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
  ''',
);
