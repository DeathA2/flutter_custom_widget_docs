import 'package:doc_widget/doc_widget.dart';

import 'floating_bottom_nav/floating_bottom_nav_preview.dart';
import 'preview/bottom_navigation_bar_custom_preview.dart';

ElementsSection renderNavigationBarSection() {
  return ElementsSection(
    elements: [bottomNavigationBarPreview, floatingBottomNavPreview],
    title: "Navigation Bar",
  );
}
