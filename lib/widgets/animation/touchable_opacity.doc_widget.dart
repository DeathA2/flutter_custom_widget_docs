// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class TouchableOpacityDocWidget implements Documentation {
  @override
  String get name => 'TouchableOpacity';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'key', isRequired: false, isNamed: true, type: 'Key?'),
    PropertyDoc(
      name: 'child',
      isRequired: true,
      isNamed: true,
      type: 'Widget',
      description: 'The wrapped content.',
    ),
    PropertyDoc(
      name: 'onTap',
      isRequired: true,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Called on tap. Null disables interaction — the widget stops taking taps and,\n when [isButton], reports itself disabled to screen readers.',
    ),
    PropertyDoc(
      name: 'onLongPress',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Secondary action on long press. Also exposed to screen readers as a\n long-press action.',
    ),
    PropertyDoc(
      name: 'duration',
      isRequired: false,
      isNamed: true,
      type: 'Duration',
      description: 'Duration of the fade / scale animation.',
      defaultValue: 'const Duration(milliseconds: 50)',
    ),
    PropertyDoc(
      name: 'pressedOpacity',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'Opacity while pressed. `1.0` leaves opacity unchanged.',
      defaultValue: '0.5',
    ),
    PropertyDoc(
      name: 'pressedScale',
      isRequired: false,
      isNamed: true,
      type: 'double',
      description: 'Scale while pressed. `1.0` leaves size unchanged.',
      defaultValue: '1.0',
    ),
    PropertyDoc(
      name: 'isButton',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Declares this a button, enabled or disabled according to [onTap].',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'semanticsLabel',
      isRequired: false,
      isNamed: true,
      type: 'String?',
      description:
          'One label for the whole tap target. It *replaces* whatever the subtree reads\n out, so leave it null when the subtree already says the right thing.',
    ),
    PropertyDoc(
      name: 'minSize',
      isRequired: false,
      isNamed: true,
      type: 'double?',
      description:
          'Smallest side of the tap target in logical pixels. Pass `48` for anything\n platform guidelines would flag; the visible part keeps its own size.',
    ),
    PropertyDoc(
      name: 'deferTap',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Defers [onTap] until after the current frame. Turn on for buttons whose\n callback navigates or opens a sheet.',
      defaultValue: 'false',
    ),
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

/// Wraps [child] in a tap target that gives visual feedback.
@docWidget
class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.duration = const Duration(milliseconds: 50),
    this.pressedOpacity = 0.5,
    this.pressedScale = 1.0,
    this.isButton = false,
    this.semanticsLabel,
    this.minSize,
    this.deferTap = false,
  });

  /// Scale-on-press variant, for buttons and tappable cells.
  const TouchableOpacity.scale({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.duration = const Duration(milliseconds: 120),
    this.pressedOpacity = 1.0,
    this.pressedScale = 0.96,
    this.isButton = false,
    this.semanticsLabel,
    this.minSize,
    this.deferTap = false,
  });

  /// The wrapped content.
  final Widget child;

  /// Called on tap. Null disables interaction — the widget stops taking taps and,
  /// when [isButton], reports itself disabled to screen readers.
  final VoidCallback? onTap;

  /// Secondary action on long press. Also exposed to screen readers as a
  /// long-press action.
  final VoidCallback? onLongPress;

  /// Duration of the fade / scale animation.
  final Duration duration;

  /// Opacity while pressed. `1.0` leaves opacity unchanged.
  final double pressedOpacity;

  /// Scale while pressed. `1.0` leaves size unchanged.
  final double pressedScale;

  /// Declares this a button, enabled or disabled according to [onTap].
  final bool isButton;

  /// One label for the whole tap target. It *replaces* whatever the subtree reads
  /// out, so leave it null when the subtree already says the right thing.
  final String? semanticsLabel;

  /// Smallest side of the tap target in logical pixels. Pass `48` for anything
  /// platform guidelines would flag; the visible part keeps its own size.
  final double? minSize;

  /// Defers [onTap] until after the current frame. Turn on for buttons whose
  /// callback navigates or opens a sheet.
  final bool deferTap;

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  void _handleTap() {
    _setPressed(false);
    final VoidCallback? callback = widget.onTap;
    if (callback == null) return;
    if (!widget.deferTap) {
      callback();
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      callback();
    });
  }

  void _handleLongPress() {
    _setPressed(false);
    widget.onLongPress?.call();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = widget.child;

    if (widget.pressedScale != 1.0) {
      content = AnimatedScale(
        scale: _pressed ? widget.pressedScale : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: content,
      );
    }

    if (widget.pressedOpacity != 1.0) {
      content = AnimatedOpacity(
        duration: widget.duration,
        opacity: _pressed ? widget.pressedOpacity : 1.0,
        child: content,
      );
    }

    final double? minSize = widget.minSize;
    if (minSize != null) {
      content = ConstrainedBox(
        constraints: BoxConstraints(minWidth: minSize, minHeight: minSize),
        child: Center(child: content),
      );
    }

    Widget result = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: widget.onTap == null ? null : (_) => _setPressed(true),
      onTapUp: widget.onTap == null ? null : (_) => _setPressed(false),
      onTapCancel: widget.onTap == null ? null : () => _setPressed(false),
      onTap: widget.onTap == null ? null : _handleTap,
      onLongPress: widget.onLongPress == null ? null : _handleLongPress,
      child: content,
    );

    final String? label = widget.semanticsLabel;
    if (widget.isButton || label != null || widget.onLongPress != null) {
      result = Semantics(
        container: true,
        button: widget.isButton,
        enabled: widget.isButton ? widget.onTap != null : null,
        label: label,
        onLongPress: widget.onLongPress,
        excludeSemantics: label != null,
        child: result,
      );
    }

    return result;
  }
}
''';
}
