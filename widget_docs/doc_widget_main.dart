import 'package:flutter/material.dart';
import 'doc_preview_app.dart';
import 'widgets/animation/animation_section.dart';
import 'widgets/ruler/ruler_section.dart';

void main() {
  runApp(
    DocPreviewApp(
      sections: [renderAnimationSection(), renderRulerSection()],
      title: 'Custom Widgets Document',
    ),
  );
}
