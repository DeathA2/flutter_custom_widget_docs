// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class DetailArticleCardDocWidget implements Documentation {
  @override
  String get name => 'DetailArticleCard';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'articleType',
          isRequired: true,
          isNamed: true,
          type: 'ArticleType',
        ),
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
      ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
        'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)'
      ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
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
''';
}
