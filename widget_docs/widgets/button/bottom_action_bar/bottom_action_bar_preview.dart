import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/bottom_action_bar.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/bottom_action_bar.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final _documentation = BottomActionBarDocWidget();

final bottomActionBarPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Bottom Action Bar",
  description:
      "Action bar pinned to the bottom of the screen. It adds `viewInsets.bottom` to its own padding, so when the keyboard opens the bar rides up with it instead of sitting underneath it.",
  dependencies: _documentation.dependencies,
  code: r'''
BottomActionBar(
  child: FilledButtonApp(
    label: 'Confirm',
    variant: FilledButtonVariant.primaryCta,
    onPressed: () {},
  ),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: Column(
      children: [
        const Spacer(),
        BottomActionBar(
          child: FilledButtonApp(
            label: 'Confirm',
            variant: FilledButtonVariant.primaryCta,
            onPressed: () {},
          ),
        ),
      ],
    ),
  ),
  widgetCode: r'''
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
  ''',
);
