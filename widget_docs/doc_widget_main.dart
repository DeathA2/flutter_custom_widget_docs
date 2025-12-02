import 'package:flutter/material.dart';
import 'doc_preview_app.dart';
import 'widgets/animation/animation_section.dart';
import 'widgets/card/card_section.dart';
import 'widgets/ruler/ruler_section.dart';
import 'widgets/shadow_box/shadow_box_section.dart';

void main() {
  runApp(
    DocPreviewApp(
      sections: [
        renderAnimationSection(),
        renderCardSection(),
        renderRulerSection(),
        renderShadowBoxSection(),
      ],
      title: 'Custom Widgets Document',
    ),
  );
}
