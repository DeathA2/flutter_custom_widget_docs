// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class TypingDotsDocWidget implements Documentation {
  @override
  String get name => 'TypingDots';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'color',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral500',
    ),
    PropertyDoc(
      name: 'dotSize',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '7: 7.0',
    ),
    PropertyDoc(
      name: 'gap',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '5: 5.0',
    ),
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
  ];

  @override
  String get snippet => '''
''';

  @override
  List<String> get dependencies => [
    'dep:doc_widget: (url: https://github.com/DeathA2/doc_widget_new.git, path: packages/doc_widget, ref: master)',
  ];

  @override
  String get source => '''import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Three bouncing dots — the "typing" indicator for a chat room.
@docWidget
class TypingDots extends StatefulWidget {
  const TypingDots({
    this.color = CustomColors.neutral500,
    this.dotSize = 7,
    this.gap = 5,
    super.key,
  });

  final Color color;
  final double dotSize;
  final double gap;

  @override
  State<TypingDots> createState() => _TypingDotsState();
}

class _TypingDotsState extends State<TypingDots>
    with SingleTickerProviderStateMixin {
  AnimationController? _c;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (!MediaQuery.disableAnimationsOf(context)) {
      (_c ??= AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1100),
      )).repeat();
    }
  }

  @override
  void dispose() {
    _c?.dispose();
    super.dispose();
  }

  Widget _dot() => Container(
    width: widget.dotSize,
    height: widget.dotSize,
    decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
  );

  @override
  Widget build(BuildContext context) {
    final AnimationController? c = _c;

    if (c == null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (int i = 0; i < 3; i++) ...<Widget>[
            if (i > 0) SizedBox(width: widget.gap),
            _dot(),
          ],
        ],
      );
    }

    return AnimatedBuilder(
      animation: c,
      builder: (BuildContext context, Widget? child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (int i = 0; i < 3; i++) ...<Widget>[
              if (i > 0) SizedBox(width: widget.gap),
              Builder(
                builder: (BuildContext context) {
                  final double phase = (c.value + i * 0.13) % 1;
                  final double wave = math.sin(phase * math.pi * 2);
                  return Transform.translate(
                    offset: Offset(0, -wave * 2),
                    child: Opacity(
                      opacity: 0.35 + 0.65 * ((wave + 1) / 2),
                      child: _dot(),
                    ),
                  );
                },
              ),
            ],
          ],
        );
      },
    );
  }
}
''';
}
