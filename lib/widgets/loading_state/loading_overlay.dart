import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/activity_indicator.dart';

/// Blocking loading overlay whose message can be updated while it is showing.
abstract final class LoadingOverlay {
  static OverlayEntry? _entry;
  static final ValueNotifier<String> _message = ValueNotifier<String>('');

  static bool get isShowing => _entry != null;

  static void show(BuildContext context, {String message = ''}) {
    if (_entry != null) {
      _message.value = message;
      return;
    }
    final OverlayState? overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    _message.value = message;
    final OverlayEntry entry = OverlayEntry(
      builder: (BuildContext context) => LoadingLayer(message: _message),
    );
    _entry = entry;
    overlay.insert(entry);
  }

  static void update(String message) => _message.value = message;

  static void hide() {
    _entry?.remove();
    _entry = null;
  }
}

@docWidget
class LoadingLayer extends StatelessWidget {
  const LoadingLayer({required this.message, super.key});

  final ValueListenable<String> message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.35),
      child: Center(
        child: ValueListenableBuilder<String>(
          valueListenable: message,
          builder: (BuildContext context, String text, Widget? child) {
            final bool hasText = text.isNotEmpty;
            return Container(
              width: hasText ? 150 : 88,
              padding: EdgeInsets.all(hasText ? 20 : 24),
              decoration: BoxDecoration(
                color: const Color(0xF2111827),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ActivityIndicator(
                    radius: 16,
                    color: CustomColors.white,
                  ),
                  if (hasText) ...<Widget>[
                    const SizedBox(height: 14),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: CustomColors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
