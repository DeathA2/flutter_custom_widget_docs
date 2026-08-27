import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/reaction_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_docs/widgets/preview/device_frame_switcher.dart';

void main() {
  testWidgets('a preview that pops cannot empty the frame navigator', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1600, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // ReactionBar returns its result with `Navigator.pop`. Shown bare there is
    // no dialog above it, so without a guard that pop removes the frame's only
    // route; the emptied history then trips `_history.isNotEmpty` on the next
    // build, in whichever preview the reader opens afterwards.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: DeviceFrameSwitcher(
              child: ReactionBar(choices: <String>['❤️', '👍'], tileSize: 40),
            ),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(ReactionBar), findsOneWidget);

    await tester.tap(find.text('❤️'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));

    expect(tester.takeException(), isNull);
    expect(
      find.byType(ReactionBar),
      findsOneWidget,
      reason: 'the frame route must survive a pop from the preview',
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });
}
