import 'package:flutter/material.dart';
import 'doc_preview_app.dart';
import 'widgets/animation/animation_section.dart';
import 'widgets/buttons/buttons_section.dart';
import 'widgets/inputs/inputs_section.dart';
import 'widgets/selection/selection_section.dart';
import 'widgets/navigation/navigation_section.dart';
import 'widgets/card/card_section.dart';
import 'widgets/charts/charts_section.dart';
import 'widgets/ruler/ruler_section.dart';
import 'widgets/loading_state/loading_state_section.dart';
import 'widgets/chat/chat_section.dart';
import 'widgets/gesture/gesture_section.dart';
import 'widgets/images/images_section.dart';
import 'widgets/celebration/celebration_section.dart';
import 'widgets/illustration/illustration_section.dart';
import 'widgets/decorations/decorations_section.dart';
import 'widgets/shadow_box/shadow_box_section.dart';

void main() {
  runApp(
    DocPreviewApp(
      sections: [
        renderAnimationSection(),
        renderButtonsSection(),
        renderInputsSection(),
        renderSelectionSection(),
        renderNavigationSection(),
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
      ],
      title: 'Custom Widgets Document',
    ),
  );
}
