import 'package:doc_widget/doc_widget.dart';

import 'app_text_field/app_text_field_preview.dart';
import 'pin_code_input/pin_code_input_preview.dart';
import 'search_field/search_field_preview.dart';

ElementsSection renderInputsSection() {
  return ElementsSection(
    elements: [appTextFieldPreview, pinCodeInputPreview, searchFieldPreview],
    title: 'Inputs',
  );
}
