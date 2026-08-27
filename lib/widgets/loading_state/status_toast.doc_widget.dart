// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class StatusToastDocWidget implements Documentation {
  @override
  String get name => 'StatusToast';

  @override
  bool get hasState => false;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(
      name: 'message',
      isRequired: true,
      isNamed: true,
      type: 'String',
    ),
    PropertyDoc(
      name: 'icon',
      isRequired: false,
      isNamed: true,
      type: 'IconData?',
    ),
    PropertyDoc(
      name: 'tint',
      isRequired: false,
      isNamed: true,
      type: 'Color?',
      description: 'Icon colour. Null leaves the icon white, like the text.',
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
  String get source => '''import 'dart:async';

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
''';
}
