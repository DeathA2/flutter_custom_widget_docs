import 'package:doc_widget/doc_widget.dart';

import 'preview/container_with_shadow_preview.dart';

ElementsSection renderShadowBoxSection() {
  return ElementsSection(
    elements: [
      containerWithShadowPreview
    ],
    title: "Shadow Box",
  );
}