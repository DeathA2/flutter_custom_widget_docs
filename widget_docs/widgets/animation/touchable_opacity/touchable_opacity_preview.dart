import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = TouchableOpacityDocWidget();

final touchableOpacityPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Touchable Opacity",
  description:
      "Press feedback for anything `InkWell` cannot cover correctly — rounded images, shadowed cards, custom paint. Two flavours share one widget because they are the same job said two ways: the default constructor fades the child on press, while `TouchableOpacity.scale` shrinks it, which reads as a physical push and suits buttons (fading a solid colour block just makes it look disabled). Both share the accessibility half: `isButton` declares it a button and reports enabled/disabled from `onTap`, `semanticsLabel` collapses the subtree into one label, and `minSize` grows the hit area without changing what you see. `deferTap` postpones the callback to after the current frame, for buttons that navigate or open a sheet.",
  dependencies: _documentation.dependencies,
  code: r'''
TouchableOpacity(
  onTap: () {},
  child: myComplexWidget,
),

TouchableOpacity.scale(
  isButton: true,
  semanticsLabel: 'Save',
  onTap: () {},
  child: myButtonBody,
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Default: fades on press'),
          const SizedBox(height: 8),
          TouchableOpacity(
            onTap: () {},
            child: Container(
              width: 220,
              height: 96,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CustomColors.brandSoft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('Complex UI widget'),
            ),
          ),
          const SizedBox(height: 28),
          const Text('.scale: shrinks on press'),
          const SizedBox(height: 8),
          TouchableOpacity.scale(
            isButton: true,
            semanticsLabel: 'Save',
            onTap: () {},
            child: Container(
              width: 220,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CustomColors.brand,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  color: CustomColors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
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
  ''',
);
