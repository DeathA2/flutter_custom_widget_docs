import 'package:doc_widget/doc_widget.dart';

import 'countdown_button/countdown_button_preview.dart';
import 'fill_button/fill_button_preview.dart';
import 'focus_button/focus_button_preview.dart';
import 'icon_outline_button/icon_outline_button_preview.dart';
import 'outline_button/outline_button_preview.dart';
import 'section_button/section_button_preview.dart';
import 'select_button/select_button_preview.dart';
import 'text_and_icon_button/text_and_icon_button_preview.dart';
import 'text_action_button/text_action_button_preview.dart';
import 'outline_cta_button/outline_cta_button_preview.dart';
import 'bottom_action_bar/bottom_action_bar_preview.dart';

ElementsSection renderButtonSection() {
  return ElementsSection(
    elements: [
      countdownButtonPreview,
      fillButtonPreview,
      focusButtonPreview,
      iconOutlineButtonPreview,
      outlineButtonPreview,
      sectionButtonPreview,
      selectButtonPreview,
      textAndIconButtonPreview,
      textActionButtonPreview,
      outlineCtaButtonPreview,
      bottomActionBarPreview,
    ],
    title: "Buttons",
  );
}
