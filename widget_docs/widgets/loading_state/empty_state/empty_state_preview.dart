import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/buttons/fill_button.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/empty_state.dart';
import 'package:flutter_custom_widget_docs/widgets/loading_state/empty_state.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = EmptyStateDocWidget();

final emptyStatePreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Empty State",
  description:
      "Emoji or icon, title, body and an optional call to action, plus an optional \"read aloud\" button for readers who cannot read yet. `bottomReserve` exists because the app shell uses `extendBody: true`: the body runs under the floating nav bar, so without reserving that strip the centred content looks pushed off-centre.",
  dependencies: _documentation.dependencies,
  code: r'''
EmptyState(
  title: 'No entries yet',
  body: 'Add your first entry to start tracking.',
  emoji: '📭',
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: EmptyState(
        title: 'No entries yet',
        body: 'Add your first entry to start tracking your readings.',
        emoji: '📭',
        onSpeak: () {},
        action: FilledButtonApp(
          label: 'Add entry',
          variant: FilledButtonVariant.primaryCta,
          fullWidth: false,
          onPressed: () {},
        ),
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// Empty state: icon or emoji, title, body, and an optional call to action.
@docWidget
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    this.body,
    this.emoji = '📭',
    this.icon,
    this.action,
    this.onSpeak,
    this.large = false,
    this.bottomReserve = 0,
    super.key,
  });

  final String title;
  final String? body;
  final String emoji;
  final IconData? icon;
  final Widget? action;

  /// Speaker button for readers who cannot read yet. Null hides it.
  final VoidCallback? onSpeak;

  final bool large;
  final double bottomReserve;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomReserve),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: large ? 160 : 120,
                height: large ? 160 : 120,
                child: Center(
                  child: icon != null
                      ? Icon(
                          icon,
                          size: large ? 76 : 56,
                          color: CustomColors.brand.withValues(alpha: 0.75),
                        )
                      : Text(
                          emoji,
                          style: TextStyle(fontSize: large ? 76 : 56),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: large ? 22 : 18,
                        color: CustomColors.ink,
                      ),
                    ),
                  ),
                  if (onSpeak != null) ...<Widget>[
                    const SizedBox(width: 4),
                    TouchableOpacity.scale(
                      isButton: true,
                      semanticsLabel: 'Read aloud',
                      minSize: 48,
                      onTap: onSpeak,
                      child: const Icon(
                        Icons.volume_up_rounded,
                        color: CustomColors.brand,
                        size: 28,
                      ),
                    ),
                  ],
                ],
              ),
              if (body != null) ...<Widget>[
                const SizedBox(height: 8),
                Text(
                  body!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.neutral700,
                    height: 1.4,
                    fontSize: large ? 16 : 14,
                  ),
                ),
              ],
              if (action != null) ...<Widget>[
                const SizedBox(height: 20),
                action!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
  ''',
);
