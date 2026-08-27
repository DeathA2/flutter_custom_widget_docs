import 'dart:async';

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/celebration/confetti.dart';

/// Default colours of the round well behind the character.
const List<Color> _kDefaultWellColors = <Color>[
  CustomColors.lavenderSoft,
  CustomColors.lavender,
];

/// Companion character: breathes continuously, and on tap bounces, tilts and
/// bursts confetti.
@docWidget
class CompanionAvatar extends StatefulWidget {
  const CompanionAvatar({
    required this.emoji,
    this.size = 126,
    this.emojiSize = 68,
    this.interactive = true,
    this.badgeLabel,
    this.onTap,
    this.wellColors,
    this.semanticsLabel = 'Tap to pet',
    super.key,
  });

  final String emoji;

  /// Diameter of the round "well".
  final double size;

  final double emojiSize;

  /// False drops the tap handler, confetti and haptics, leaving only the breath
  /// loop — for rows whose parent card is already one tap target.
  final bool interactive;

  /// Pill label hanging under the well, e.g. "Stage 2/5". Null hides it.
  final String? badgeLabel;

  /// Called after the tap animation runs — for sound, analytics, and so on.
  final VoidCallback? onTap;

  /// Well gradient. Null uses the lavender tones.
  final List<Color>? wellColors;
  final String semanticsLabel;

  @override
  State<CompanionAvatar> createState() => _CompanionAvatarState();
}

class _CompanionAvatarState extends State<CompanionAvatar>
    with TickerProviderStateMixin {
  late final AnimationController _breathe = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3500),
  );

  /// Both ends of the sequence rest at the original state.
  late final AnimationController _bounce = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 620),
  );

  late final Animation<double> _bounceScale =
      TweenSequence<double>(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1,
            end: 1.18,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 35,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1.18,
            end: 1,
          ).chain(CurveTween(curve: Curves.elasticOut)),
          weight: 65,
        ),
      ]).animate(_bounce);

  late final Animation<double> _bounceTilt =
      TweenSequence<double>(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0,
            end: 0.14,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 35,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0.14,
            end: 0,
          ).chain(CurveTween(curve: Curves.elasticOut)),
          weight: 65,
        ),
      ]).animate(_bounce);

  ConfettiController? _burst;

  /// Cleared by a timer so rapid tapping cannot pile up particle systems.
  bool _cooling = false;
  Timer? _cooldown;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    if (widget.interactive) {
      _burst = ConfettiController(duration: const Duration(milliseconds: 900));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (!MediaQuery.disableAnimationsOf(context)) {
      _breathe.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _cooldown?.cancel();
    _breathe.dispose();
    _bounce.dispose();
    _burst?.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_cooling) return;

    _cooling = true;
    _cooldown?.cancel();
    _cooldown = Timer(const Duration(milliseconds: 700), () {
      if (mounted) _cooling = false;
    });

    HapticFeedback.lightImpact();

    if (!MediaQuery.disableAnimationsOf(context)) {
      _bounce.forward(from: 0);
      _burst?.play();
    }

    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final Widget creature = AnimatedBuilder(
      animation: Listenable.merge(<Listenable>[_breathe, _bounce]),
      child: Text(widget.emoji, style: TextStyle(fontSize: widget.emojiSize)),
      builder: (BuildContext context, Widget? child) {
        final double breath = Curves.easeInOut.transform(_breathe.value);
        return Transform.translate(
          offset: Offset(0, -5 * breath),
          child: Transform.rotate(
            angle: _bounceTilt.value,
            child: Transform.scale(
              scale: (1 + 0.05 * breath) * _bounceScale.value,
              child: child,
            ),
          ),
        );
      },
    );

    Widget disc = Container(
      width: widget.size,
      height: widget.size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: widget.wellColors ?? _kDefaultWellColors,
          radius: 0.85,
        ),
      ),
      child: creature,
    );

    if (widget.interactive) {
      disc = Semantics(
        button: true,
        label: widget.semanticsLabel,
        excludeSemantics: true,
        child: GestureDetector(
          onTap: _handleTap,
          behavior: HitTestBehavior.opaque,
          child: disc,
        ),
      );
    } else {
      disc = ExcludeSemantics(child: disc);
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        disc,
        if (_burst != null)
          Positioned(
            top: widget.size / 2,
            width: widget.size * 2,
            height: widget.size * 2,
            child: Confetti(
              controller: _burst!,
              alignment: Alignment.center,
              particleCount: 14,
              gravity: 0.25,
              pathBuilder: ParticlePaths.streamer,
              colors: const <Color>[
                CustomColors.reward,
                CustomColors.gold,
                CustomColors.lavender,
              ],
            ),
          ),
        if (widget.badgeLabel != null)
          Positioned(
            bottom: -12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: CustomColors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: CustomColors.lavender, width: 1.5),
              ),
              child: Text(
                widget.badgeLabel!,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: CustomColors.brand,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
