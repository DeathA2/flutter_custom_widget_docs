import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/gesture/swipe_actions.dart';
import 'package:flutter_custom_widget_docs/widgets/gesture/swipe_actions.doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/gesture/swipe_hint.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = SwipeActionsDocWidget();

final swipeActionsPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Swipe Actions",
  description:
      "Swipe left to reveal actions, hand-rolled rather than `flutter_slidable`. Pass an empty `actions` list and it returns the child untouched — a tray that opens onto nothing is worse than no gesture at all. Swipe alone is an accessibility dead end, since the gesture is invisible to a screen reader, so the same actions are also on long press and are registered through `customSemanticsActions`. Two physics details: it snaps on velocity as well as position, so a quick flick opens the tray; and an open tray closes itself when the list scrolls, instead of drifting off screen half-open.",
  dependencies: _documentation.dependencies,
  code: r'''
SwipeActions(
  actions: [
    SwipeAction(
      icon: Icons.delete_rounded,
      label: 'Delete',
      background: CustomColors.error,
      foreground: CustomColors.white,
      onTap: () {},
    ),
  ],
  child: const ListTile(title: Text('Entry, Aug 12')),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.canvas,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwipeActions(
            actions: [
              SwipeAction(
                icon: Icons.edit_rounded,
                label: 'Edit',
                background: CustomColors.info,
                foreground: CustomColors.white,
                onTap: () {},
              ),
              SwipeAction(
                icon: Icons.delete_rounded,
                label: 'Delete',
                background: CustomColors.error,
                foreground: CustomColors.white,
                onTap: () {},
              ),
            ],
            child: Container(
              color: CustomColors.white,
              padding: const EdgeInsets.all(16),
              child: const Text('Swipe left to reveal the actions'),
            ),
          ),
          const SizedBox(height: 12),
          const SwipeHint(text: 'Swipe left to edit or delete'),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart' show CustomSemanticsAction;

/// One action revealed by a swipe in [SwipeActions].
class SwipeAction {
  const SwipeAction({
    required this.icon,
    required this.label,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;
}

/// Swipe left to reveal actions — hand-rolled, no `flutter_slidable`.
@docWidget
class SwipeActions extends StatefulWidget {
  const SwipeActions({
    required this.child,
    required this.actions,
    this.actionWidth = 76,
    this.radius = 20,
    this.onLongPress,
    super.key,
  });

  final Widget child;
  final List<SwipeAction> actions;
  final double actionWidth;
  final double radius;

  /// Second route to the same set of actions. See the class docs.
  final VoidCallback? onLongPress;

  @override
  State<SwipeActions> createState() => _SwipeActionsState();
}

class _SwipeActionsState extends State<SwipeActions>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  );

  double get _maxDrag => widget.actions.length * widget.actionWidth;

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_maxDrag <= 0) return;
    _c.value = (_c.value - details.primaryDelta! / _maxDrag).clamp(0.0, 1.0);
  }

  void _onDragEnd(DragEndDetails details) {
    final double velocity = details.primaryVelocity ?? 0;
    if (velocity < -600) {
      _c.forward();
    } else if (velocity > 600) {
      _c.reverse();
    } else if (_c.value > 0.5) {
      _c.forward();
    } else {
      _c.reverse();
    }
  }

  void _close() => _c.reverse();

  @override
  Widget build(BuildContext context) {
    if (widget.actions.isEmpty) return widget.child;

    return Semantics(
      customSemanticsActions: <CustomSemanticsAction, VoidCallback>{
        for (final SwipeAction action in widget.actions)
          CustomSemanticsAction(label: action.label): action.onTap,
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification && _c.value > 0) {
            _close();
          }
          return false;
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.radius),
          child: GestureDetector(
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            onLongPress: widget.onLongPress,
            child: AnimatedBuilder(
              animation: _c,
              child: widget.child,
              builder: (BuildContext context, Widget? child) {
                final double dx = -_c.value * _maxDrag;
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          for (final SwipeAction action in widget.actions)
                            SizedBox(
                              width: widget.actionWidth * _c.value,
                              child: _SwipeActionButton(
                                action: action,
                                onTap: () {
                                  _close();
                                  action.onTap();
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                    Transform.translate(offset: Offset(dx, 0), child: child),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _SwipeActionButton extends StatelessWidget {
  const _SwipeActionButton({required this.action, required this.onTap});

  final SwipeAction action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: action.background,
        alignment: Alignment.center,
        child: ClipRect(
          child: OverflowBox(
            maxWidth: 76,
            minWidth: 76,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(action.icon, size: 20, color: action.foreground),
                const SizedBox(height: 4),
                Text(
                  action.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: action.foreground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  ''',
);
