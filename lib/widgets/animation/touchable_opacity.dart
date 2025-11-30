import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

@docWidget
class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({super.key, required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;
  final Duration duration = const Duration(milliseconds: 50);
  final double opacity = 0.5;

  @override
  State<TouchableOpacity> createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  bool isDown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isDown = true),
      onTapUp: (_) => setState(() => isDown = false),
      onTapCancel: () => setState(() => isDown = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        duration: widget.duration,
        opacity: isDown ? widget.opacity : 1,
        child: widget.child,
      ),
    );
  }
}
