import 'dart:async';

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/countdown_button.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/countdown_button.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = CountdownButtonAppDocWidget();

final countdownButtonPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultButtonPreview],
);

//Default
final _defaultButtonPreview = renderPreview(
  title: "I. Default Button",
  dependencies: documentation.dependencies,
  widgetCode: documentation.source,
  description:
      "The default button is filled by the blue primary color and the lable required. When click button, it changes to grey background and timer countdown",
  code: '''
  int _countdownTime = 0;
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CountdownButtonApp(
            label: 'Click me!',
            countdownString: 'Send in 0:\$_countdownTime',
            isEnable: _countdownTime != 0 ? false : true,
            onPressed: () {
              _countdownTime = 60;
              _timer = Timer.periodic(const Duration(seconds: 1), (_) {
                setState(() {
                  if (_countdownTime == 0) {
                    _timer?.cancel();
                  } else {
                    _countdownTime--;
                  }
                });
              });
            },
          ),
        ),
      ],
    );
  }
    ''',
  widget: DeviceFrameSwitcher(child: const CountDownButtonSample()),
);

class CountDownButtonSample extends StatefulWidget {
  const CountDownButtonSample({super.key});

  @override
  State<CountDownButtonSample> createState() => _CountDownButtonSampleState();
}

class _CountDownButtonSampleState extends State<CountDownButtonSample> {
  int _countdownTime = 0;
  Timer? _timer;

  @override
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CountdownButtonApp(
            color: ColorsApp.bluePrimary,
            label: 'Click me!',
            countdownString: 'Send in 0:$_countdownTime',
            isEnable: _countdownTime == 0,
            onPressed: () {
              _countdownTime = 60;
              _timer = Timer.periodic(const Duration(seconds: 1), (_) {
                setState(() {
                  if (_countdownTime == 0) {
                    _timer?.cancel();
                  } else {
                    _countdownTime--;
                  }
                });
              });
            },
          ),
        ),
      ],
    );
  }
}
