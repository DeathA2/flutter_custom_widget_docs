import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/celebration/celebration_overlay.dart';
import 'package:flutter_custom_widget_docs/widgets/celebration/celebration_overlay.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = CelebrationOverlayDocWidget();

final celebrationOverlayPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Celebration Overlay",
  description:
      "Full-screen celebration: a card with an emoji, a message and confetti. `CelebrationKind` packages the emoji, the duration and whether confetti fires for each occasion, so \"approved\" and \"sent back\" cannot accidentally celebrate the same way. It opens on the root navigator so it floats above a tab shell, and stays barrier-dismissible — nobody wants to be held for 2.6 seconds.",
  dependencies: _documentation.dependencies,
  code: r'''
await showCelebration(
  context,
  message: 'Weekly goal complete!',
  kind: CelebrationKind.goal,
);
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoSurface(
      background: CustomColors.brandTint,
      child: Builder(
        builder: (BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 300,
              child: CelebrationOverlay(
                message: 'Weekly goal complete!',
                kind: CelebrationKind.goal,
              ),
            ),
            OutlinedButton(
              onPressed: () => showCelebration(
                context,
                message: 'Weekly goal complete!',
                kind: CelebrationKind.goal,
              ),
              child: const Text('Open the real overlay'),
            ),
          ],
        ),
      ),
    ),
  ),
  widgetCode: r'''
import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/celebration/confetti.dart';

/// Kind of celebration moment. Decides the emoji, the duration, and whether
/// confetti fires.
enum CelebrationKind {
  /// Finished a task.
  success('🎉', 2200, true),

  /// Approved.
  approve('✅', 2200, true),

  /// Rejected or sent back — no confetti. Celebrating here is the wrong tone.
  reject('🔄', 2000, false),

  /// Reached a savings goal.
  goal('🏆', 2600, true),

  /// Kept a streak, or earned a badge.
  streak('🔥', 2000, true),

  /// Levelled up — the biggest moment.
  levelUp('⭐', 2600, true);

  const CelebrationKind(this.glyph, this.durationMs, this.withConfetti);

  final String glyph;
  final int durationMs;
  final bool withConfetti;
}

/// Full-screen celebration overlay.
@docWidget
class CelebrationOverlay extends StatefulWidget {
  const CelebrationOverlay({
    required this.message,
    this.kind = CelebrationKind.success,
    this.visual,
    super.key,
  });

  final String message;
  final CelebrationKind kind;

  /// Replaces the artwork above the message. Confetti, duration, barrier and
  /// dismissal still come from here, so the app keeps a single celebration overlay.
  final Widget? visual;

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay> {
  late final ConfettiController _centre = ConfettiController(
    duration: Duration(milliseconds: widget.kind.durationMs),
  );
  late final ConfettiController _left = ConfettiController(
    duration: Duration(milliseconds: widget.kind.durationMs),
  );
  late final ConfettiController _right = ConfettiController(
    duration: Duration(milliseconds: widget.kind.durationMs),
  );

  bool _fired = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_fired || !widget.kind.withConfetti) return;
    _fired = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (MediaQuery.disableAnimationsOf(context)) return;
      _centre.play();
      _left.play();
      _right.play();
    });
  }

  @override
  void dispose() {
    _centre.dispose();
    _left.dispose();
    _right.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Material(
        color: Colors.black54,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            if (widget.kind.withConfetti) ...<Widget>[
              Confetti(
                controller: _centre,
                particleCount: 28,
                pathBuilder: ParticlePaths.star,
              ),
              Confetti(
                controller: _left,
                alignment: Alignment.centerLeft,
                particleCount: 16,
                blastDirection: -math.pi / 4,
                spread: math.pi / 3,
                pathBuilder: ParticlePaths.rectangle,
              ),
              Confetti(
                controller: _right,
                alignment: Alignment.centerRight,
                particleCount: 16,
                blastDirection: -3 * math.pi / 4,
                spread: math.pi / 3,
                pathBuilder: ParticlePaths.rectangle,
              ),
            ],
            Center(
              child: _CelebrationCard(
                message: widget.message,
                kind: widget.kind,
                visual: widget.visual,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CelebrationCard extends StatefulWidget {
  const _CelebrationCard({
    required this.message,
    required this.kind,
    this.visual,
  });

  final String message;
  final CelebrationKind kind;
  final Widget? visual;

  @override
  State<_CelebrationCard> createState() => _CelebrationCardState();
}

class _CelebrationCardState extends State<_CelebrationCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 360),
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
      curve: Curves.easeOutBack,
    );

    return FadeTransition(
      opacity: CurvedAnimation(parent: _c, curve: const Interval(0, 0.5)),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.92, end: 1).animate(curve),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
          decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              widget.visual ??
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: Center(
                      child: Text(
                        widget.kind.glyph,
                        style: const TextStyle(fontSize: 84),
                      ),
                    ),
                  ),
              const SizedBox(height: 8),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                  color: CustomColors.ink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shows a celebration moment and dismisses itself.
Future<void> showCelebration(
  BuildContext context, {
  required String message,
  CelebrationKind kind = CelebrationKind.success,
  Widget? visual,
  int? holdMs,
}) async {
  final int hold = holdMs ?? kind.durationMs;

  await showGeneralDialog<void>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: true,
    barrierLabel: 'celebration',
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 180),
    pageBuilder:
        (
          BuildContext dialogContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          Future<void>.delayed(Duration(milliseconds: hold), () {
            if (dialogContext.mounted) {
              Navigator.of(dialogContext).maybePop();
            }
          });
          return CelebrationOverlay(
            message: message,
            kind: kind,
            visual: visual,
          );
        },
    transitionBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) => FadeTransition(opacity: animation, child: child),
  );
}
  ''',
);
