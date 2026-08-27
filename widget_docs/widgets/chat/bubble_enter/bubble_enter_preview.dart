import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/bubble_enter.dart';
import 'package:flutter_custom_widget_docs/widgets/chat/bubble_enter.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = BubbleEnterDocWidget();

final bubbleEnterPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Bubble Enter",
  description:
      "Fade plus a small pop as a bubble arrives. It runs exactly once, on first mount — scrolling a list back and forth must not make every old message look like it just landed.",
  dependencies: _documentation.dependencies,
  code: r'''
BubbleEnter(child: myBubble),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: BubbleEnter(
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Text('A message just arrived'),
        ),
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Fades and slides up as a new bubble arrives.
@docWidget
class BubbleEnter extends StatefulWidget {
  const BubbleEnter({required this.child, super.key});

  final Widget child;

  @override
  State<BubbleEnter> createState() => _BubbleEnterState();
}

class _BubbleEnterState extends State<BubbleEnter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  );

  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (MediaQuery.disableAnimationsOf(context)) {
      _c.value = 1;
    } else {
      _c.forward();
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CurvedAnimation curve = CurvedAnimation(
      parent: _c,
      curve: Curves.easeOutCubic,
    );
    return FadeTransition(
      opacity: curve,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.18),
          end: Offset.zero,
        ).animate(curve),
        child: widget.child,
      ),
    );
  }
}
  ''',
);
