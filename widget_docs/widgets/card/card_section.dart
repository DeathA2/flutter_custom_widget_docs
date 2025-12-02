import 'package:doc_widget/doc_widget.dart';

import 'article_card/article_card_preview.dart';
import 'article_card/detail_article_card_mobile_preview.dart';

ElementsSection renderCardSection() {
  return ElementsSection(
    elements: [renderArticleCardPreview, renderDetailArticleCardPreview],
    title: 'Card',
  );
}
