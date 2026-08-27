import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/pulse_on_change.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/pulse_on_change.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = PulseOnChangeDocWidget();

final pulseOnChangePreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Pulse On Change",
  description:
      "Swells once on the `false → true` edge of `active`, pulling the eye to what just changed without running an animation forever. It never fires from `initState`, and that matters: cards like this remount constantly — tabs swapped through `AnimatedSwitcher`, loading→ready rebuilding the list, `ListView` recycling rows scrolled past the cache extent — and a mount-triggered pulse replays \"you just unlocked this!\" every time the user walks back into the tab.",
  dependencies: _documentation.dependencies,
  code: r'''
PulseOnChange(
  active: isNew,
  child: const Icon(Icons.notifications_rounded),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<bool>(
      initial: false,
      builder: (BuildContext context, bool value, ValueChanged<bool> set) =>
          DemoSurface(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PulseOnChange(
                  active: value,
                  peak: 1.35,
                  child: const Icon(
                    Icons.notifications_active_rounded,
                    size: 56,
                    color: CustomColors.reward,
                  ),
                ),
                const SizedBox(height: 24),
                OutlinedButton(
                  onPressed: () => set(!value),
                  child: const Text('Toggle'),
                ),
              ],
            ),
          ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Pulses once on the `false -> true` edge of [active].
@docWidget
class PulseOnChange extends StatefulWidget {
  const PulseOnChange({
    required this.active,
    required this.child,
    this.peak = 1.06,
    this.duration = const Duration(milliseconds: 900),
    super.key,
  });

  final bool active;
  final Widget child;
  final double peak;
  final Duration duration;

  @override
  State<PulseOnChange> createState() => _PulseOnChangeState();
}

class _PulseOnChangeState extends State<PulseOnChange>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: widget.duration,
  );

  /// Swells then settles, so both ends of the controller rest at 1.0. A plain
  /// `Tween(begin: 1, end: 1.06)` would leave the widget permanently enlarged.
  late final Animation<double> _scale =
      TweenSequence<double>(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1,
            end: widget.peak,
          ).chain(CurveTween(curve: Curves.easeOutBack)),
          weight: 35,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: widget.peak,
            end: 1,
          ).chain(CurveTween(curve: Curves.elasticOut)),
          weight: 65,
        ),
      ]).animate(_pulse);

  @override
  void didUpdateWidget(covariant PulseOnChange oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active &&
        !oldWidget.active &&
        !MediaQuery.disableAnimationsOf(context)) {
      _pulse.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (BuildContext context, Widget? child) =>
          Transform.scale(scale: _scale.value, child: child),
      child: widget.child,
    );
  }
}
  ''',
);
