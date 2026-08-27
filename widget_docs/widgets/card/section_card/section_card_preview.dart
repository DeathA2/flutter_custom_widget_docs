import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/section_card.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/section_card.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/settings_tile.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = SectionCardDocWidget();

final sectionCardPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Section Card",
  description:
      "Groups settings rows in a titled card and inserts the dividers itself. Dividers are indented 56 so they line up with the text rather than cutting across the icons.",
  dependencies: _documentation.dependencies,
  code: r'''
SectionCard(
  title: 'Account',
  children: [
    SettingsTile(icon: Icons.person_rounded, label: 'Profile', onTap: () {}),
    SettingsTile(icon: Icons.lock_rounded, label: 'Password', onTap: () {}),
  ],
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: SectionCard(
        title: 'Account',
        children: [
          SettingsTile(
            icon: Icons.person_rounded,
            label: 'Profile',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.notifications_rounded,
            label: 'Notifications',
            trailingText: 'On',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.logout_rounded,
            label: 'Sign out',
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

/// Groups settings rows in a titled card, inserting dividers between rows.
@docWidget
class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.title,
    required this.children,
    this.large = false,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: large ? 20 : 18,
              color: CustomColors.ink,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: CustomColors.neutral200),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < children.length; i++) ...<Widget>[
                if (i > 0)
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 56,
                    color: CustomColors.neutral200,
                  ),
                children[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}
  ''',
);
