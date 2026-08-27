import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/breathing.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/breathing.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/cards/emoji_avatar.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = BreathingDocWidget();

final breathingPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Breathing",
  description:
      "A slow scale-and-lift loop that says something is alive without shouting. Ambient rather than a signal: it runs identically in every state, so remounting replays nothing and claims nothing — the exact opposite of an edge-triggered pulse. It stands still when the OS has reduce-motion enabled.",
  dependencies: _documentation.dependencies,
  code: r'''
Breathing(
  child: EmojiAvatar(emoji: '🐣', size: 72),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: const Breathing(
        scaleAmount: 0.06,
        liftAmount: 4,
        child: EmojiAvatar(emoji: '🐣', size: 88),
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Slow looping "breath": scales up and down, optionally lifting as well.
@docWidget
class Breathing extends StatefulWidget {
  const Breathing({
    required this.child,
    this.enabled = true,
    this.scaleAmount = 0.05,
    this.liftAmount = 0,
    this.period = const Duration(milliseconds: 3000),
    super.key,
  });

  final Widget child;
  final bool enabled;

  /// How much larger it grows at the peak. `0.05` means +5%.
  final double scaleAmount;

  /// How many pixels it lifts at the peak. 0 scales only.
  final double liftAmount;

  final Duration period;

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing>
    with SingleTickerProviderStateMixin {
  AnimationController? _breathe;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    _sync();
  }

  @override
  void didUpdateWidget(covariant Breathing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) _sync();
  }

  void _sync() {
    if (!widget.enabled || MediaQuery.disableAnimationsOf(context)) {
      _breathe?.stop();
      _breathe?.value = 0;
      return;
    }
    (_breathe ??= AnimationController(
      vsync: this,
      duration: widget.period,
    )).repeat(reverse: true);
  }

  @override
  void dispose() {
    _breathe?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController? breathe = _breathe;
    if (breathe == null) return widget.child;

    return AnimatedBuilder(
      animation: breathe,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        final double t = Curves.easeInOut.transform(breathe.value);
        return Transform.translate(
          offset: Offset(0, -widget.liftAmount * t),
          child: Transform.scale(
            scale: 1 + widget.scaleAmount * t,
            child: child,
          ),
        );
      },
    );
  }
}
  ''',
);
