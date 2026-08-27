import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/outline_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/outline_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = OutlineButtonDocWidget();

final outlineButtonPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Outline Button",
  description:
      "Outlined button — the secondary action standing next to a filled CTA. `busy` swaps the label for a spinner and blocks taps at the same time, so there is no window where the button looks busy but still fires.",
  dependencies: _documentation.dependencies,
  code: r'''
OutlineButton(label: 'Not now', onTap: () {}),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlineButton(label: 'Not now', onTap: () {}),
          const SizedBox(height: 12),
          OutlineButton(label: 'Sending', busy: true, onTap: () {}),
          const SizedBox(height: 12),
          OutlineButton(
            label: 'Delete account',
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
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';

/// Outlined button — the secondary action standing next to [FilledButtonApp].
@docWidget
class OutlineButton extends StatelessWidget {
  const OutlineButton({
    required this.label,
    required this.onTap,
    this.busy = false,
    this.color = CustomColors.brand,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;
  final bool busy;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: label,
      onTap: busy ? null : onTap,
      child: Container(
        height: 52,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color, width: 1.5),
        ),
        child: busy
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              )
            : Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
      ),
    );
  }
}
  ''',
);
