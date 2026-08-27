import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'doc_preview_app.dart';
import 'widgets/animation/animation_section.dart';
import 'widgets/bottom_navigation_bar/navigation_bar_section.dart';
import 'widgets/button/button_section.dart';
import 'widgets/card/card_section.dart';
import 'widgets/celebration/celebration_section.dart';
import 'widgets/charts/charts_section.dart';
import 'widgets/chat/chat_section.dart';
import 'widgets/checkbox/checkbox_section.dart';
import 'widgets/decorations/decorations_section.dart';
import 'widgets/gesture/gesture_section.dart';
import 'widgets/illustration/illustration_section.dart';
import 'widgets/images/images_section.dart';
import 'widgets/inputs/inputs_section.dart';
import 'widgets/loading_state/loading_state_section.dart';
import 'widgets/ruler/ruler_section.dart';
import 'widgets/selection/selection_section.dart';
import 'widgets/shadow_box/shadow_box_section.dart';

void main() {
  runApp(
    DocPreviewApp(
      sections: _alphabetical([
        renderAnimationSection(),
        renderButtonSection(),
        renderCheckBoxSection(),
        renderInputsSection(),
        renderSelectionSection(),
        renderNavigationBarSection(),
        renderCardSection(),
        renderChartsSection(),
        renderRulerSection(),
        renderLoadingStateSection(),
        renderChatSection(),
        renderGestureSection(),
        renderImagesSection(),
        renderCelebrationSection(),
        renderIllustrationSection(),
        renderDecorationsSection(),
        renderShadowBoxSection(),
      ]),
      title: 'Custom Widgets Document',
    ),
  );
}

/// Sections, and the widgets inside each one, ordered by name.
///
/// Sorted here rather than kept by hand in every `*_section.dart`: a hand-kept
/// order drifts the moment someone appends a widget to the end of a list, which
/// is exactly what the drawer had before.
List<ElementsSection> _alphabetical(List<ElementsSection> sections) {
  int byName(String a, String b) => a.toLowerCase().compareTo(b.toLowerCase());

  return sections
      .map(
        (ElementsSection section) => ElementsSection(
          title: section.title,
          elements: List<ElementPreview>.of(section.elements)
            ..sort(
              (ElementPreview a, ElementPreview b) =>
                  byName(a.document.name, b.document.name),
            ),
        ),
      )
      .toList()
    ..sort((ElementsSection a, ElementsSection b) => byName(a.title, b.title));
}
