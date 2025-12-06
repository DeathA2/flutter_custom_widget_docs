import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/article_card.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/article_card.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/content/article_content.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = ArticleCardDocWidget();

final renderArticleCardPreview = ElementPreview(
  document: documentation,
  previews: [..._renderDefaultArticleCardPreview()],
);

List<WidgetPreview> _renderDefaultArticleCardPreview() {
  return renderPreview(
    title: 'I. Default Card',
    dependencies: documentation.dependencies,
    description: 'ArticleCard default required articleType',
    code: '''
ArticleCard(articleType: ArticleType.bloodPressure7Factors)''',
    widget: DeviceFrameSwitcher(
      child: const ArticleCard(articleType: ArticleType.bloodPressure7Factors),
    ),
    widgetCode: documentation.source,
  );
}
