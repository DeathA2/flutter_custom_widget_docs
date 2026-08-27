import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

/// Fades and slides up as a new bubble arrives.
@docWidget
class BubbleEnter extends StatefulWidget {
  const BubbleEnter({required this.child, super.key});

  final Widget child;

  @override
  State<BubbleEnter> createState() => _BubbleEnterState();
}

class _BubbleEnterState extends State<BubbleEnter>
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
          begin: const Offset(0, 0.18),
          end: Offset.zero,
        ).animate(curve),
        child: widget.child,
      ),
    );
  }
}
