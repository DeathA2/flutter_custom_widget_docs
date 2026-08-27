import 'package:doc_widget/doc_widget.dart';

import 'fill_button/fill_button_preview.dart';
import 'outline_cta_button/outline_cta_button_preview.dart';
import 'text_action_button/text_action_button_preview.dart';
import 'bottom_action_bar/bottom_action_bar_preview.dart';

ElementsSection renderButtonsSection() {
  return ElementsSection(
    elements: [
      fillButtonPreview,
      outlineButtonPreview,
      textActionButtonPreview,
      bottomActionBarPreview,
    ],
    title: 'Buttons',
  );
}
