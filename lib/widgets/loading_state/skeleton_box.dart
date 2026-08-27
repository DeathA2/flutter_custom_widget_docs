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
