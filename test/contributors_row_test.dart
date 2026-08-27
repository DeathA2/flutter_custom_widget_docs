import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/network/model/github/github_user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../widget_docs/widgets/preview/contributors_row.dart';

List<GithubUserModel> users(int n) => List<GithubUserModel>.generate(
  n,
  (int i) => GithubUserModel(id: i, login: 'user$i', htmlUrl: 'https://x/$i'),
);

Future<void> pumpRow(WidgetTester tester, int n) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Align(
          alignment: Alignment.topLeft,
          child: ContributorsRow(
            contributors: users(n),
            onTapContributor: (_) {},
          ),
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('renders without a layout assertion', (
    WidgetTester tester,
  ) async {
    // The avatars used to overlap through `EdgeInsets.only(left: -8)`, which
    // trips `Container`'s `margin.isNonNegative` assertion. It only ran once
    // the contributors had loaded, so nothing caught it until runtime.
    for (final int n in <int>[1, 3, 6, 10]) {
      await pumpRow(tester, n);
      expect(tester.takeException(), isNull, reason: '$n contributors');
    }
  });

  testWidgets('avatars overlap instead of sitting side by side', (
    WidgetTester tester,
  ) async {
    await pumpRow(tester, 3);

    final Size cluster = tester.getSize(find.byType(Stack).first);
    // Three 28pt circles overlapping by 8 occupy 28 + 20 + 20, not 3 * 28.
    expect(cluster.width, ContributorsRow.clusterWidth(3));
    expect(cluster.width, lessThan(3 * ContributorsRow.avatarSize));

    final List<double> lefts = tester
        .widgetList<Positioned>(find.byType(Positioned))
        .map((Positioned p) => p.left!)
        .toList();
    expect(lefts, <double>[0, 20, 40]);
  });

  testWidgets('collapses the tail into a +N badge', (
    WidgetTester tester,
  ) async {
    await pumpRow(tester, 10);
    expect(find.text('+4'), findsOneWidget);
    expect(find.text('10 contributors'), findsOneWidget);
  });

  testWidgets('draws nothing when there are no contributors', (
    WidgetTester tester,
  ) async {
    await pumpRow(tester, 0);
    expect(tester.getSize(find.byType(ContributorsRow)), Size.zero);
    expect(find.textContaining('contributors'), findsNothing);
  });
}
