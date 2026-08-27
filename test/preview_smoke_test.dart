import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_docs/widgets/animation/animation_section.dart';
import '../widget_docs/widgets/bottom_navigation_bar/navigation_bar_section.dart';
import '../widget_docs/widgets/button/button_section.dart';
import '../widget_docs/widgets/card/card_section.dart';
import '../widget_docs/widgets/celebration/celebration_section.dart';
import '../widget_docs/widgets/charts/charts_section.dart';
import '../widget_docs/widgets/chat/chat_section.dart';
import '../widget_docs/widgets/checkbox/checkbox_section.dart';
import '../widget_docs/widgets/decorations/decorations_section.dart';
import '../widget_docs/widgets/gesture/gesture_section.dart';
import '../widget_docs/widgets/illustration/illustration_section.dart';
import '../widget_docs/widgets/images/images_section.dart';
import '../widget_docs/widgets/inputs/inputs_section.dart';
import '../widget_docs/widgets/loading_state/loading_state_section.dart';
import '../widget_docs/widgets/ruler/ruler_section.dart';
import '../widget_docs/widgets/selection/selection_section.dart';
import '../widget_docs/widgets/shadow_box/shadow_box_section.dart';

void main() {
  final List<ElementsSection> sections = <ElementsSection>[
    renderAnimationSection(),
    renderButtonSection(),
    renderCheckBoxSection(),
    renderInputsSection(),
    renderSelectionSection(),
    renderNavigationBarSection(),
    renderCardSection(),
    renderChartsSection(),
    renderRulerSection(),
    renderLoadingStateSection(),
    renderChatSection(),
    renderGestureSection(),
    renderImagesSection(),
    renderCelebrationSection(),
    renderIllustrationSection(),
    renderDecorationsSection(),
    renderShadowBoxSection(),
  ];

  for (final ElementsSection section in sections) {
    for (final ElementPreview element in section.elements) {
      testWidgets('${section.title} / ${element.document.name} builds', (
        WidgetTester tester,
      ) async {
        tester.view.physicalSize = const Size(2400, 4000);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (final WidgetPreview p in element.previews) p.widget,
                  ],
                ),
              ),
            ),
          ),
        );
        expect(tester.takeException(), isNull);
        await tester.pump(const Duration(milliseconds: 400));
        expect(tester.takeException(), isNull);

        // Tear the tree down explicitly: several previews run endless loops
        // (shimmer, breathing, typing dots, the device frame), and the test
        // framework fails if any transient callback is still registered at
        // the end of a test.
        await tester.pumpWidget(const SizedBox.shrink());
        await tester.pump();
      });
    }
  }
}
