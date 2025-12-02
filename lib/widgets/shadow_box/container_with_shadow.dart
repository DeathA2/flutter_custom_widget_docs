import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';

@docWidget
class ContainerWithShadow extends StatelessWidget {
  final Widget child;
  final Color? shadowColor;
  final Offset shadowXY;
  final double shadowB;
  final double shadowS;
  const ContainerWithShadow({
    super.key,
    required this.child,
    this.shadowColor,
    this.shadowXY = OffsetApp.o04,
    this.shadowB = BlurRadiusApp.b10,
    this.shadowS = SpreadRadiusApp.s0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? ColorsApp.boxShadow,
            offset: shadowXY,
            blurRadius: shadowB,
            spreadRadius: shadowS,
          ),
        ],
      ),
      child: child,
    );
  }
}
