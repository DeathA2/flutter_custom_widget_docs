import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Action bar pinned to the bottom of the screen.
@docWidget
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({required this.child, this.background, super.key});

  final Widget child;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background ?? CustomColors.white,
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          10,
          16,
          12 +
              MediaQuery.viewInsetsOf(context).bottom +
              MediaQuery.paddingOf(context).bottom,
        ),
        child: child,
      ),
    );
  }
}
