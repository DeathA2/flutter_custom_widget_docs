// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class StreakFlameDocWidget implements Documentation {
  @override
  String get name => 'StreakFlame';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'days', isRequired: true, isNamed: true, type: 'int'),
    PropertyDoc(
      name: 'isActiveToday',
      isRequired: true,
      isNamed: true,
      type: 'bool',
      description:
          'A live streak with nothing logged today reads dimmer — it is at risk, not lost.',
    ),
    PropertyDoc(
      name: 'activeColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.reward',
    ),
    PropertyDoc(
      name: 'idleColor',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.neutral400',
    ),
    PropertyDoc(
      name: 'size',
      isRequired: false,
      isNamed: true,
      type: 'double',
      defaultValue: '28: 28.0',
    ),
    PropertyDoc(
      name: 'ambientPulse',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'showCount',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'False draws the flame alone, letting the caller build its own frame around it.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'glyph',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: '🔥',
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
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/pulse_on_change.dart';

/// Streak flame with the day count beside it.
@docWidget
class StreakFlame extends StatefulWidget {
  const StreakFlame({
    required this.days,
    required this.isActiveToday,
    this.activeColor = CustomColors.reward,
    this.idleColor = CustomColors.neutral400,
    this.size = 28,
    this.ambientPulse = false,
    this.showCount = true,
    this.glyph = '🔥',
    super.key,
  });

  final int days;

  /// A live streak with nothing logged today reads dimmer — it is at risk, not lost.
  final bool isActiveToday;

  final Color activeColor;
  final Color idleColor;
  final double size;
  final bool ambientPulse;

  /// False draws the flame alone, letting the caller build its own frame around it.
  final bool showCount;

  final String glyph;

  @override
  State<StreakFlame> createState() => _StreakFlameState();
}

class _StreakFlameState extends State<StreakFlame>
    with TickerProviderStateMixin {
  late final AnimationController _pop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 420),
  );

  /// Both ends rest at 1.0 — see the note on [PulseOnChange].
  late final Animation<double> _scale =
      TweenSequence<double>(<TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1,
            end: 1.25,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 40,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1.25,
            end: 1,
          ).chain(CurveTween(curve: Curves.elasticOut)),
          weight: 60,
        ),
      ]).animate(_pop);

  /// Ambient breath loop. Created lazily, since most mounts never enable it.
  AnimationController? _ambient;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    _syncAmbient();
  }

  @override
  void didUpdateWidget(covariant StreakFlame oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.days > oldWidget.days &&
        !MediaQuery.disableAnimationsOf(context)) {
      _pop.forward(from: 0);
    }
    if (oldWidget.ambientPulse != widget.ambientPulse) _syncAmbient();
  }

  void _syncAmbient() {
    if (!widget.ambientPulse || MediaQuery.disableAnimationsOf(context)) {
      _ambient?.stop();
      _ambient?.value = 0;
      return;
    }
    (_ambient ??= AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )).repeat(reverse: true);
  }

  @override
  void dispose() {
    _pop.dispose();
    _ambient?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color color = widget.isActiveToday
        ? widget.activeColor
        : widget.idleColor;

    final Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Opacity(
          opacity: widget.isActiveToday ? 1 : 0.55,
          child: Text(widget.glyph, style: TextStyle(fontSize: widget.size)),
        ),
        if (widget.showCount) ...<Widget>[
          const SizedBox(width: 6),
          Text(
            '\${widget.days}',
            style: TextStyle(
              fontSize: widget.size * 0.78,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
        ],
      ],
    );

    final AnimationController? ambient = _ambient;
    if (ambient == null) {
      return ScaleTransition(scale: _scale, child: content);
    }

    return AnimatedBuilder(
      animation: Listenable.merge(<Listenable>[_pop, ambient]),
      child: content,
      builder: (BuildContext context, Widget? child) => Transform.scale(
        scale: _scale.value * (1 + ambient.value * 0.08),
        child: child,
      ),
    );
  }
}
''';
}
