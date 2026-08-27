import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/status_toast.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/status_toast.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = StatusToastDocWidget();

final statusToastPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Status Toast",
  description:
      "The dark rounded pill, plus `Toast` — the static API that pushes it through the root `Overlay`. Overlay rather than `ScaffoldMessenger`, because a toast has to appear even while a bottom sheet or dialog covers the screen, and must never push the Scaffold layout around. A new toast replaces the current one immediately; queueing them is a reliable way to bury the message that mattered.",
  dependencies: _documentation.dependencies,
  code: r'''
Toast.success(context, 'Entry saved');
Toast.error(context, 'Connection lost');
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Builder(
        builder: (BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const StatusToast(
              message: 'Entry saved',
              icon: Icons.check_circle_rounded,
              tint: CustomColors.success,
            ),
            const SizedBox(height: 12),
            const StatusToast(
              message: 'Connection lost',
              icon: Icons.error_rounded,
              tint: CustomColors.error,
            ),
            const SizedBox(height: 24),
            FilledButtonApp(
              label: 'Fire a real toast',
              variant: FilledButtonVariant.primaryCta,
              onPressed: () => Toast.success(context, 'Entry saved'),
            ),
          ],
        ),
      ),
    ),
  ),
  widgetCode: r'''
import 'dart:async';

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Dark rounded toast pill — the visible half of [Toast].
@docWidget
class StatusToast extends StatelessWidget {
  const StatusToast({required this.message, this.icon, this.tint, super.key});

  final String message;
  final IconData? icon;

  /// Icon colour. Null leaves the icon white, like the text.
  final Color? tint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xE6111827),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: 18, color: tint ?? CustomColors.white),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              message,
              style: const TextStyle(
                color: CustomColors.white,
                fontSize: 15,
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Toast through `Overlay`: slides up, fades in, and dismisses itself.
abstract final class Toast {
  static OverlayEntry? _current;
  static Timer? _timer;

  static void success(BuildContext context, String message) => show(
    context,
    message,
    icon: Icons.check_circle_rounded,
    tint: CustomColors.success,
  );

  static void error(BuildContext context, String message) => show(
    context,
    message,
    icon: Icons.error_rounded,
    tint: CustomColors.error,
  );

  static void show(
    BuildContext context,
    String message, {
    IconData? icon,
    Color? tint,
    Duration duration = const Duration(milliseconds: 2200),
  }) {
    final OverlayState? overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    dismiss();

    final double bottomInset = MediaQuery.paddingOf(context).bottom;
    final OverlayEntry entry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: 0,
        right: 0,
        bottom: bottomInset + 90,
        child: IgnorePointer(
          child: _ToastAnimation(
            child: StatusToast(message: message, icon: icon, tint: tint),
          ),
        ),
      ),
    );

    _current = entry;
    overlay.insert(entry);
    _timer = Timer(duration, dismiss);
  }

  static void dismiss() {
    _timer?.cancel();
    _timer = null;
    _current?.remove();
    _current = null;
  }
}

class _ToastAnimation extends StatefulWidget {
  const _ToastAnimation({required this.child});

  final Widget child;

  @override
  State<_ToastAnimation> createState() => _ToastAnimationState();
}

class _ToastAnimationState extends State<_ToastAnimation>
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
          begin: const Offset(0, 0.4),
          end: Offset.zero,
        ).animate(curve),
        child: Material(color: Colors.transparent, child: widget.child),
      ),
    );
  }
}
  ''',
);
