import 'package:flutter/material.dart';
import 'doc_preview_app.dart';
import 'widgets/animation/animation_section.dart';

void main() {
  runApp(
    DocPreviewApp(
      sections: [renderAnimationSection()],
      title: 'Custom Widgets Document',
    ),
  );
}
