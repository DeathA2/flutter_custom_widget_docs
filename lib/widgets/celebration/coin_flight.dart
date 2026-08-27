import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/illustration/coin.dart';

/// Global centre of the render box carrying [key], or null before layout.
Offset? globalCenterOf(GlobalKey key) {
  final BuildContext? ctx = key.currentContext;
  if (ctx == null) return null;
  final RenderObject? object = ctx.findRenderObject();
  if (object is! RenderBox || !object.hasSize || !object.attached) return null;
  return object.localToGlobal(object.size.center(Offset.zero));
}

/// How many coins should fly for an amount — more money, more coins, capped.
int coinFlightCount(double amount) {
  if (amount >= 200000) return 6;
  if (amount >= 100000) return 5;
  if (amount >= 50000) return 4;
  return 3;
}

/// Flies a burst of coins along an arc from [fromGlobal] to [toGlobal], then
/// cleans itself up.
Future<void> playCoinFlight(
  BuildContext context, {
  required Offset fromGlobal,
  required Offset toGlobal,
  int coinCount = 4,
  Color coinColor = CustomColors.gold,
}) async {
  if (!context.mounted) return;
  if (MediaQuery.disableAnimationsOf(context)) return;
  if ((toGlobal - fromGlobal).distance < 8) return;

  final OverlayState? overlay = Overlay.maybeOf(context, rootOverlay: true);
  if (overlay == null) return;

  final int count = coinCount.clamp(2, 7);
  final Completer<void> completer = Completer<void>();
  late final OverlayEntry entry;

  entry = OverlayEntry(
    builder: (BuildContext context) => _CoinFlightLayer(
      from: fromGlobal,
      to: toGlobal,
      coinCount: count,
      coinColor: coinColor,
      onCompleted: () {
        entry.remove();
        if (!completer.isCompleted) completer.complete();
      },
    ),
  );

  overlay.insert(entry);

  try {
    await completer.future.timeout(const Duration(milliseconds: 1400));
  } on TimeoutException {
    if (!completer.isCompleted) {
      entry.remove();
      completer.complete();
    }
  }
}

class _CoinFlightLayer extends StatefulWidget {
  const _CoinFlightLayer({
    required this.from,
    required this.to,
    required this.coinCount,
    required this.coinColor,
    required this.onCompleted,
  });

  final Offset from;
  final Offset to;
  final int coinCount;
  final Color coinColor;
  final VoidCallback onCompleted;

  @override
  State<_CoinFlightLayer> createState() => _CoinFlightLayerState();
}

class _CoinFlightLayerState extends State<_CoinFlightLayer>
    with SingleTickerProviderStateMixin {
  static const Duration _duration = Duration(milliseconds: 820);
  static const double _coinSize = 36;

  late final AnimationController _controller;
  late final List<_CoinSpec> _coins;

  @override
  void initState() {
    super.initState();
    final double midX = (widget.from.dx + widget.to.dx) / 2;
    final double midY = math.min(widget.from.dy, widget.to.dy);

    _coins = List<_CoinSpec>.generate(widget.coinCount, (int i) {
      final double t = widget.coinCount <= 1
          ? 0
          : (i / (widget.coinCount - 1)) - 0.5;
      return _CoinSpec(
        delay: i * 0.07,
        control: Offset(midX + t * 56, midY - 72 - (i % 3) * 14),
        size: _coinSize - (i % 3) * 2,
      );
    });

    _controller = AnimationController(vsync: this, duration: _duration)
      ..forward().whenComplete(widget.onCompleted);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: <Widget>[
              for (final _CoinSpec spec in _coins)
                ..._buildCoin(spec, _controller.value),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _buildCoin(_CoinSpec spec, double t) {
    final double span = 1 - spec.delay;
    if (span <= 0) return const <Widget>[];
    final double local = ((t - spec.delay) / span).clamp(0.0, 1.0);
    if (local <= 0) return const <Widget>[];

    final double curved = Curves.easeInOutCubic.transform(local);
    final Offset pos = _quadraticBezier(
      widget.from,
      spec.control,
      widget.to,
      curved,
    );

    final double scale = local < 0.12
        ? Curves.easeOut.transform(local / 0.12) * 1.05
        : local > 0.85
        ? 1.05 - (local - 0.85) / 0.15 * 0.55
        : 1.0;
    final double opacity = local > 0.9
        ? (1 - (local - 0.9) / 0.1).clamp(0.0, 1.0)
        : 1.0;

    return <Widget>[
      Positioned(
        left: pos.dx - spec.size / 2,
        top: pos.dy - spec.size / 2,
        child: Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: scale,
            child: Coin(size: spec.size, lifted: true, color: widget.coinColor),
          ),
        ),
      ),
    ];
  }
}

class _CoinSpec {
  const _CoinSpec({
    required this.delay,
    required this.control,
    required this.size,
  });

  final double delay;
  final Offset control;
  final double size;
}

/// Quadratic bezier — the point on the flight arc at time [t] in 0..1.
Offset _quadraticBezier(Offset a, Offset b, Offset c, double t) {
  final double u = 1 - t;
  return Offset(
    u * u * a.dx + 2 * u * t * b.dx + t * t * c.dx,
    u * u * a.dy + 2 * u * t * b.dy + t * t * c.dy,
  );
}
