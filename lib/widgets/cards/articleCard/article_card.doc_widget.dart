// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ArticleCardDocWidget implements Documentation {
  @override
  String get name => 'ArticleCard';

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
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
    'dep:modal_bottom_sheet: 3.0.0',
  ];

  @override
  String get source => '''import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/content/article_content.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/articleCard/detail_article_card.dart';
import 'package:flutter_custom_widget_docs/widgets/shadow_box/container_with_shadow.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@docWidget
class ArticleCard extends StatelessWidget {
  final ArticleType articleType;

  const ArticleCard({required this.articleType, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
          child: ContainerWithShadow(
            child: Card(
              margin: const EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(BorderRadiusApp.r16),
                side: BorderSide(color: ColorsApp.bgInput),
              ),
              elevation: 0,
              child: Stack(
                children: [
                  _renderImage(selectImagePath(articleType)),
                  _renderCardContent(articleType),
                  _renderInkWell(context, articleType),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderImage(String imagePath) {
    return SizedBox(
      width: double.infinity,
      child: Image(fit: BoxFit.fitWidth, image: AssetImage(imagePath)),
    );
  }

  Widget _renderCardContent(ArticleType articleType) {
    return Container(
      margin: const EdgeInsets.only(top: MarginApp.m160),
      padding: const EdgeInsets.fromLTRB(
        PaddingApp.p16,
        PaddingApp.p8,
        PaddingApp.p16,
        PaddingApp.p12,
      ),
      color: ColorsApp.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectArticleTitle(articleType),
            style: TextStylesApp.bold(
              color: ColorsApp.greyPrimary,
              fontSize: FontSizeApp.s18,
            ).copyWith(height: 30 / 18),
          ),
          const SizedBox(height: SizeApp.s4),
          Text(
            selectFirstSentence(articleType),
            style: TextStylesApp.regular(
              color: ColorsApp.greyTertiary,
              fontSize: FontSizeApp.s14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _renderInkWell(BuildContext context, ArticleType articleType) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showCupertinoModalBottomSheet(
            duration: DurationsApp.bottomSheetFullScreenDuration,
            animationCurve: Curves.easeOut,
            context: context,
            builder: (context) => DetailArticleCard(articleType: articleType),
            barrierColor: Colors.black.withValues(alpha: OpacityApp.opa80),
            enableDrag: true,
            isDismissible: true,
            topRadius: const Radius.circular(BorderRadiusApp.r16),
          ),
          splashColor: ColorsApp.white.withValues(alpha: OpacityApp.opa20),
          highlightColor: ColorsApp.white.withValues(alpha: OpacityApp.opa10),
        ),
      ),
    );
  }
}
''';
}
