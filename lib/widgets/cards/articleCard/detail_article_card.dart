import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/content/article_content.dart';

@docWidget
class DetailArticleCard extends StatelessWidget {
  final ArticleType articleType;
  const DetailArticleCard({required this.articleType, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(PaddingApp.p16),
            child: TweenAnimationBuilder(
              tween: Tween<double>(
                begin: OpacityApp.opa00,
                end: OpacityApp.opa100,
              ),
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 1500),
              builder: (_, double opacity, __) {
                return Opacity(
                  opacity: opacity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(selectImagePath(articleType)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: PaddingApp.p8,
                          vertical: PaddingApp.p18,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: PaddingApp.p18,
                              ),
                              child: Text(
                                selectArticleTitle(articleType),
                                style: TextStylesApp.bold(
                                  color: ColorsApp.greyPrimary,
                                  fontSize: FontSizeApp.s22,
                                ).copyWith(height: 32 / 22),
                              ),
                            ),
                            selectArticleContent(articleType),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
