// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class PinCodeInputDocWidget implements Documentation {
  @override
  String get name => 'PinCodeInput';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'value', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'onChanged',
      isRequired: true,
      isNamed: true,
      type: 'void Function(String)',
    ),
    PropertyDoc(
      name: 'length',
      isRequired: false,
      isNamed: true,
      type: 'int',
      defaultValue: '6',
    ),
    PropertyDoc(
      name: 'obscure',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description: 'Filled boxes show a dot instead of the digit.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'allowReveal',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description:
          'Shows the eye button. The "revealed" flag stays local — a PIN in bloc state\n is one `copyWith` away from being logged.',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'autofocus',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'enabled',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'true',
    ),
    PropertyDoc(
      name: 'errorText',
      isRequired: false,
      isNamed: true,
      type: 'String?',
      description: 'Puts the boxes in an error state and runs one shake.',
    ),
    PropertyDoc(
      name: 'onCompleted',
      isRequired: false,
      isNamed: true,
      type: 'void Function()?',
      description:
          'Fires once, on the edge where the PIN becomes complete — not on every\n keystroke while it stays complete.',
    ),
    PropertyDoc(
      name: 'focusNode',
      isRequired: false,
      isNamed: true,
      type: 'FocusNode?',
      description:
          'Pass one in to move focus between two PIN fields. When passed, the caller\n owns it.',
    ),
    PropertyDoc(
      name: 'semanticsLabel',
      isRequired: false,
      isNamed: true,
      type: 'String',
      defaultValue: 'PIN code',
    ),
    PropertyDoc(
      name: 'accent',
      isRequired: false,
      isNamed: true,
      type: 'Color',
      defaultValue: 'CustomColors.brand',
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
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/shake_container.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';

/// PIN entry field.
@docWidget
class PinCodeInput extends StatefulWidget {
  const PinCodeInput({
    required this.value,
    required this.onChanged,
    this.length = 6,
    this.obscure = true,
    this.allowReveal = true,
    this.autofocus = false,
    this.enabled = true,
    this.errorText,
    this.onCompleted,
    this.focusNode,
    this.semanticsLabel = 'PIN code',
    this.accent = CustomColors.brand,
    super.key,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final int length;

  /// Filled boxes show a dot instead of the digit.
  final bool obscure;

  /// Shows the eye button. The "revealed" flag stays local — a PIN in bloc state
  /// is one `copyWith` away from being logged.
  final bool allowReveal;

  final bool autofocus;
  final bool enabled;

  /// Puts the boxes in an error state and runs one shake.
  final String? errorText;

  /// Fires once, on the edge where the PIN becomes complete — not on every
  /// keystroke while it stays complete.
  final VoidCallback? onCompleted;

  /// Pass one in to move focus between two PIN fields. When passed, the caller
  /// owns it.
  final FocusNode? focusNode;

  final String semanticsLabel;
  final Color accent;

  @override
  State<PinCodeInput> createState() => _PinCodeInputState();
}

class _PinCodeInputState extends State<PinCodeInput> {
  late final TextEditingController _controller;
  FocusNode? _ownedFocus;
  late FocusNode _focus;

  bool _revealed = false;

  /// Plain field, not tracked through `setState`: it exists only so
  /// [PinCodeInput.onCompleted] fires on the rising edge of completeness.
  int _previousLength = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _previousLength = widget.value.length;
    if (widget.focusNode == null) _ownedFocus = FocusNode();
    _focus = widget.focusNode ?? _ownedFocus!;
    _focus.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant PinCodeInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.focusNode != oldWidget.focusNode) {
      _focus.removeListener(_onFocusChanged);
      _focus = widget.focusNode ?? (_ownedFocus ??= FocusNode());
      _focus.addListener(_onFocusChanged);
    }

    if (widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
      _previousLength = widget.value.length;
    }
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChanged);
    _ownedFocus?.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (mounted) setState(() {});
  }

  void _handleChanged(String raw) {
    final String digits = raw.length > widget.length
        ? raw.substring(0, widget.length)
        : raw;

    if (_controller.selection.baseOffset != digits.length ||
        !_controller.selection.isCollapsed) {
      _controller.value = TextEditingValue(
        text: digits,
        selection: TextSelection.collapsed(offset: digits.length),
      );
    }

    widget.onChanged(digits);

    final bool wasFull = _previousLength >= widget.length;
    _previousLength = digits.length;
    if (!wasFull && digits.length >= widget.length) {
      widget.onCompleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasError = (widget.errorText ?? '').isNotEmpty;

    final Widget boxes = Row(
      children: <Widget>[
        for (int i = 0; i < widget.length; i++) ...<Widget>[
          if (i > 0) const SizedBox(width: 10),
          Expanded(
            child: _PinBox(
              index: i,
              value: widget.value,
              accent: widget.accent,
              revealed: _revealed || !widget.obscure,
              focused: _focus.hasFocus,
              hasError: hasError,
            ),
          ),
        ],
      ],
    );

    return Semantics(
      label: widget.semanticsLabel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.enabled ? _focus.requestFocus : null,
                child: ExcludeSemantics(
                  child: hasError
                      ? ShakeContainer(
                          shakeTrigger: widget.errorText!,
                          shakeOffset: 8,
                          shakeCount: 4,
                          shakeDuration: const Duration(milliseconds: 320),
                          decay: true,
                          child: boxes,
                        )
                      : boxes,
                ),
              ),
              Positioned.fill(
                child: Opacity(
                  opacity: 0,
                  alwaysIncludeSemantics: true,
                  child: TextField(
                    controller: _controller,
                    focusNode: _focus,
                    enabled: widget.enabled,
                    autofocus: widget.autofocus,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(widget.length),
                    ],
                    obscureText: true,
                    showCursor: false,
                    enableInteractiveSelection: false,
                    autocorrect: false,
                    enableSuggestions: false,
                    style: const TextStyle(fontSize: 20, height: 1),
                    decoration: const InputDecoration.collapsed(
                      hintText: '',
                    ).copyWith(counterText: ''),
                    onChanged: _handleChanged,
                  ),
                ),
              ),
            ],
          ),
          if (widget.allowReveal && widget.obscure) ...<Widget>[
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TouchableOpacity.scale(
                isButton: true,
                semanticsLabel: _revealed ? 'Hide PIN' : 'Show PIN',
                minSize: 48,
                onTap: () => setState(() => _revealed = !_revealed),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  child: Icon(
                    _revealed
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    size: 20,
                    color: CustomColors.neutral500,
                  ),
                ),
              ),
            ),
          ],
          if (hasError) ...<Widget>[
            const SizedBox(height: 6),
            Text(
              widget.errorText!,
              style: const TextStyle(fontSize: 12, color: CustomColors.error),
            ),
          ],
        ],
      ),
    );
  }
}

class _PinBox extends StatelessWidget {
  const _PinBox({
    required this.index,
    required this.value,
    required this.accent,
    required this.revealed,
    required this.focused,
    required this.hasError,
  });

  final int index;
  final String value;
  final Color accent;
  final bool revealed;
  final bool focused;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final bool isFilled = index < value.length;
    final bool isActive = index == value.length && focused;
    final bool reduceMotion = MediaQuery.disableAnimationsOf(context);

    final Color borderColor = hasError
        ? CustomColors.error
        : isActive
        ? accent
        : isFilled
        ? accent.withValues(alpha: 0.5)
        : CustomColors.neutral200;

    final Widget box = AnimatedContainer(
      duration: reduceMotion
          ? Duration.zero
          : const Duration(milliseconds: 160),
      curve: Curves.easeOut,
      height: 58,
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: isActive ? 1.8 : 1.2),
      ),
      alignment: Alignment.center,
      child: !isFilled
          ? null
          : revealed
          ? Text(
              value[index],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: CustomColors.ink,
              ),
            )
          : Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: CustomColors.ink,
                shape: BoxShape.circle,
              ),
            ),
    );

    if (!isFilled || reduceMotion) return box;

    return TweenAnimationBuilder<double>(
      key: ValueKey<String>('pin-\$index-filled'),
      tween: Tween<double>(begin: 0.82, end: 1),
      duration: const Duration(milliseconds: 140),
      curve: Curves.easeOutBack,
      builder: (BuildContext context, double scale, Widget? child) =>
          Transform.scale(scale: scale, child: child),
      child: box,
    );
  }
}
''';
}
