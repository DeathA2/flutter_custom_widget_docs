import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/shake_container.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/shake_container.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';

import '../../preview/bio_preview.dart';

final shakeContainer = ElementPreview(
  document: ShakeContainerDocWidget(),
  previews: [..._renderShakeContainerPreview()],
);

List<WidgetPreview> _renderShakeContainerPreview() {
  return renderPreview(
    title: 'Shake Container',
    description:
        'You want more attention when something wrong ? Shake Container will help you emphasize your mistake anytime when you confirm wrong filler',
    code: '''
Builder(builder: (context) {
  final shakeKey = GlobalKey<ShakeContainerState>();
  return Column(
    children: [
      FilledButtonApp(
        label: "Click here to shake",
        onPressed: () {
          shakeKey.currentState?.shake();
        },
      ),
      ShakeContainer(
        key: shakeKey,
        child: Container(
          height: 40,
          width: 40,
          color: ColorsApp.redGradient,
        ),
        shakeDuration: const Duration(milliseconds: 600),
        shakeCount: 3,
        shakeOffset: 10,
      ),
    ],
  );
});''',
    widget: _renderShakeContainer(),
  );
}

Widget _renderShakeContainer() {
  return Builder(
    builder: (context) {
      final shakeKey = GlobalKey<ShakeContainerState>();
      return Column(
        children: [
          FilledButtonApp(
            label: "Click here to shake",
            onPressed: () {
              shakeKey.currentState?.shake();
            },
          ),
          ShakeContainer(
            key: shakeKey,
            shakeDuration: const Duration(milliseconds: 600),
            shakeCount: 3,
            shakeOffset: 10,
            child: Container(
              height: 40,
              width: 40,
              color: ColorsApp.redGradient,
            ),
          ),
        ],
      );
    },
  );
}
