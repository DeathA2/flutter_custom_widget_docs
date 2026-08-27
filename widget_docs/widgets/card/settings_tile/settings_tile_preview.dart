import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/settings_tile.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/settings_tile.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = SettingsTileDocWidget();

final settingsTilePreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Settings Tile",
  description:
      "One settings row: icon, label, secondary value on the right. `destructive` turns both the icon and the label the error colour, so a delete action looks different from an ordinary one before a finger ever reaches it. A `trailing` widget replaces the chevron entirely, but the row stays tappable — avoid controls that take taps of their own.",
  dependencies: _documentation.dependencies,
  code: r'''
SettingsTile(
  icon: Icons.notifications_rounded,
  label: 'Notifications',
  trailingText: 'On',
  onTap: () {},
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingsTile(
            icon: Icons.notifications_rounded,
            label: 'Notifications',
            trailingText: 'On',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.language_rounded,
            label: 'Language',
            trailingText: 'English',
            large: true,
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.delete_outline_rounded,
            label: 'Delete account',
            destructive: true,
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

/// One settings row: icon, label, secondary value, chevron.
@docWidget
class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailingText,
    this.trailing,
    this.large = false,
    this.accent = CustomColors.brand,
    this.destructive = false,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String? trailingText;

  /// Replaces the chevron entirely — a `Switch`, for example. The row stays
  /// tappable, so avoid controls that take taps of their own.
  final Widget? trailing;

  final bool large;
  final Color accent;

  /// Sign out / delete account — label and icon turn the error colour.
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final Color fg = destructive ? CustomColors.error : accent;

    return TouchableOpacity.scale(
      isButton: true,
      semanticsLabel: trailingText == null ? label : '$label, $trailingText',
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: large ? 16 : 14,
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, size: large ? 26 : 22, color: fg),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: large ? 17 : 15,
                  color: destructive ? CustomColors.error : CustomColors.ink,
                ),
              ),
            ),
            if (trailingText != null) ...<Widget>[
              Text(
                trailingText!,
                style: TextStyle(
                  color: CustomColors.neutral500,
                  fontWeight: FontWeight.w600,
                  fontSize: large ? 15 : 13,
                ),
              ),
              const SizedBox(width: 6),
            ],
            trailing ??
                Icon(
                  Icons.chevron_right_rounded,
                  color: CustomColors.neutral400,
                  size: large ? 26 : 22,
                ),
          ],
        ),
      ),
    );
  }
}
  ''',
);
