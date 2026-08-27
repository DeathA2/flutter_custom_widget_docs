import 'package:doc_widget/doc_widget.dart';

import 'article_card/article_card_preview.dart';
import 'article_card/detail_article_card_mobile_preview.dart';
import 'surface_card/surface_card_preview.dart';
import 'section_card/section_card_preview.dart';
import 'settings_tile/settings_tile_preview.dart';
import 'feature_tile/feature_tile_preview.dart';
import 'gradient_progress_card/gradient_progress_card_preview.dart';
import 'info_chip/info_chip_preview.dart';
import 'freshness_pill/freshness_pill_preview.dart';
import 'emoji_avatar/emoji_avatar_preview.dart';

ElementsSection renderCardSection() {
  return ElementsSection(
    elements: [
      renderArticleCardPreview,
      renderDetailArticleCardPreview,
      surfaceCardPreview,
      sectionCardPreview,
      settingsTilePreview,
      featureTilePreview,
      gradientProgressCardPreview,
      infoChipPreview,
      freshnessPillPreview,
      emojiAvatarPreview,
    ],
    title: 'Cards & Tiles',
  );
}
