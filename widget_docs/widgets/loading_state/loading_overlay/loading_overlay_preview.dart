import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/loading_overlay.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/loading_overlay.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final _documentation = LoadingLayerDocWidget();

final ValueNotifier<String> _demoMessage = ValueNotifier<String>(
  'Syncing your data…',
);

final loadingOverlayPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Loading Overlay",
  description:
      "Blocking overlay whose message can be updated while it is still showing, through a `ValueListenable`. `LoadingOverlay` is a singleton because the call site is usually an interceptor or a bloc with no `BuildContext` to hold a handle; calling `show` twice in a row is a no-op rather than two stacked dialogs.",
  dependencies: _documentation.dependencies,
  code: r'''
LoadingOverlay.show(context, message: 'Syncing…');
LoadingOverlay.update('Almost done…');
LoadingOverlay.hide();
  ''',
  widget: DeviceFrameSwitcher(child: LoadingLayer(message: _demoMessage)),
  widgetCode: r'''
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
  ''',
);
