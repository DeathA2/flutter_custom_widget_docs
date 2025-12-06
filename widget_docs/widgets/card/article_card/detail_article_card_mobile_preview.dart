import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/content/article_content.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/detail_article_card.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/detail_article_card.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = DetailArticleCardDocWidget();

final renderDetailArticleCardPreview = ElementPreview(
  document: documentation,
  previews: [..._renderDefaultDetailArticleCardPreview()],
);

List<WidgetPreview> _renderDefaultDetailArticleCardPreview() {
  return renderPreview(
    title: 'I. Default Card',
    dependencies: documentation.dependencies,
    description: 'DetailArticleCard show detail of content',
    code: '''
Builder(builder: (context) {
        return FilledButtonApp(
          label: "Click to show DetailArticleCard",
          onPressed: () {
            showCupertinoModalBottomSheet(
                context: context,
                builder: ((context) {
                  return DetailArticleCard(
                      articleType: ArticleType.bloodPressureNormalByAge);
                }));
          },
        );
      })''',
    widgetCode: documentation.source,
    widget: DeviceFrameSwitcher(
      child: DetailArticleCard(articleType: ArticleType.bloodPressure7Factors),
    ),
  );
}
