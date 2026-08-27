import 'package:doc_widget/doc_widget.dart';

import 'network_image_view/network_image_view_preview.dart';
import 'proof_image/proof_image_preview.dart';
import 'sliver_image_header/sliver_image_header_preview.dart';

ElementsSection renderImagesSection() {
  return ElementsSection(
    elements: [
      networkImageViewPreview,
      proofImagePreview,
      sliverImageHeaderPreview,
    ],
    title: 'Images',
  );
}
