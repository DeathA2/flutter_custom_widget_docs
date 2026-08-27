// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class SwipeActionsDocWidget implements Documentation {
  @override
  String get name => 'SwipeActions';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'child', isRequired: true, isNamed: true, type: 'Widget'),
    PropertyDoc(
      name: 'actions',
      isRequired: true,
      isNamed: true,
      type: 'List<SwipeAction>',
    ),
    PropertyDoc(
      name: 'actionWidth',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '76: 76.0',
    ),
    PropertyDoc(
      name: 'radius',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '20: 20.0',
    ),
    PropertyDoc(
      name: 'onLongPress',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Second route to the same set of actions. See the class docs.',
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
  String get source => '''import 'package:doc_widget/doc_widget.dart';
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
''';
}
