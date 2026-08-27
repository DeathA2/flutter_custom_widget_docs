import 'package:doc_widget/doc_widget.dart';

import 'coin/coin_preview.dart';
import 'jar_visual/jar_visual_preview.dart';

ElementsSection renderIllustrationSection() {
  return ElementsSection(
    elements: [coinPreview, jarVisualPreview],
    title: 'Illustrations',
  );
}
