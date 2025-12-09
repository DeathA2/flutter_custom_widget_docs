import 'package:flutter/material.dart';
import 'doc_preview_app.dart';
import 'widgets/animation/animation_section.dart';
import 'widgets/bottom_navigation_bar/navigation_bar_section.dart';
import 'widgets/button/button_section.dart';
import 'widgets/card/card_section.dart';
import 'widgets/checkbox/checkbox_section.dart';
import 'widgets/ruler/ruler_section.dart';
import 'widgets/shadow_box/shadow_box_section.dart';

void main() {
  runApp(
    DocPreviewApp(
      sections: [
        renderAnimationSection(),
        renderButtonSection(),
        renderCardSection(),
        renderCheckBoxSection(),
        renderNavigationBarSection(),
        renderRulerSection(),
        renderShadowBoxSection(),
      ],
      title: 'Custom Widgets Document',
    ),
  );
}
