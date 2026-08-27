// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class AppTextFieldDocWidget implements Documentation {
  @override
  String get name => 'AppTextField';

  @override
  bool get hasState => true;

  @override
  String? get deprecation => null;

  @override
  List<PropertyDoc> get properties => [
    PropertyDoc(name: 'value', isRequired: true, isNamed: true, type: 'String'),
    PropertyDoc(
      name: 'onChanged',
      isRequired: false,
      isNamed: true,
      type: 'void Function(String)?',
    ),
    PropertyDoc(
      name: 'label',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'hint',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'helperText',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'errorText',
      isRequired: false,
      isNamed: true,
      type: 'String?',
    ),
    PropertyDoc(
      name: 'keyboardType',
      isRequired: false,
      isNamed: true,
      type: 'TextInputType?',
    ),
    PropertyDoc(
      name: 'obscureText',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'textAlign',
      isRequired: false,
      isNamed: true,
      type: 'TextAlign',
      defaultValue: 'TextAlign.start',
    ),
    PropertyDoc(
      name: 'maxLength',
      isRequired: false,
      isNamed: true,
      type: 'int?',
    ),
    PropertyDoc(
      name: 'maxLines',
      isRequired: false,
      isNamed: true,
      type: 'int',
      defaultValue: '1',
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
      name: 'readOnly',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      defaultValue: 'false',
    ),
    PropertyDoc(
      name: 'inputFormatters',
      isRequired: false,
      isNamed: true,
      type: 'List<TextInputFormatter>?',
    ),
    PropertyDoc(
      name: 'onSubmitted',
      isRequired: false,
      isNamed: true,
      type: 'void Function(String)?',
    ),
    PropertyDoc(
      name: 'focusNode',
      isRequired: false,
      isNamed: true,
      type: 'FocusNode?',
    ),
    PropertyDoc(
      name: 'prefixIcon',
      isRequired: false,
      isNamed: true,
      type: 'IconData?',
    ),
    PropertyDoc(
      name: 'clearable',
      isRequired: false,
      isNamed: true,
      type: 'bool',
      description: 'Shows a clear button while there is content.',
      defaultValue: 'true',
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

/// Controlled text field: the value comes from [value], every change is
/// reported through [onChanged].
@docWidget
class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.value,
    this.onChanged,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.maxLines = 1,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.inputFormatters,
    this.onSubmitted,
    this.focusNode,
    this.prefixIcon,
    this.clearable = true,
    super.key,
  });

  final String value;
  final ValueChanged<String>? onChanged;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final TextAlign textAlign;
  final int? maxLength;
  final int maxLines;
  final bool autofocus;
  final bool enabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final IconData? prefixIcon;

  /// Shows a clear button while there is content.
  final bool clearable;

  @override
  State<AppTextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<AppTextField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value,
  );
  late bool _obscured = widget.obscureText;

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller.text != widget.value) {
      final int cursor = _controller.selection.baseOffset;
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(
          offset: (cursor >= 0 && cursor <= widget.value.length)
              ? cursor
              : widget.value.length,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? _buildSuffix() {
    final List<Widget> actions = <Widget>[];

    if (widget.clearable &&
        _controller.text.isNotEmpty &&
        widget.enabled &&
        !widget.readOnly) {
      actions.add(
        IconButton(
          icon: const Icon(Icons.cancel, size: 20),
          tooltip: 'Clear',
          color: CustomColors.neutral400,
          onPressed: () {
            _controller.clear();
            widget.onChanged?.call('');
            setState(() {});
          },
        ),
      );
    }

    if (widget.obscureText) {
      actions.add(
        IconButton(
          icon: Icon(
            _obscured
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 20,
          ),
          color: CustomColors.neutral500,
          tooltip: _obscured ? 'Show password' : 'Hide password',
          onPressed: () => setState(() => _obscured = !_obscured),
        ),
      );
    }

    if (actions.isEmpty) return null;
    if (actions.length == 1) return actions.first;
    return Row(mainAxisSize: MainAxisSize.min, children: actions);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      focusNode: widget.focusNode,
      onChanged: (String text) {
        widget.onChanged?.call(text);
        setState(() {});
      },
      keyboardType: widget.keyboardType,
      textAlign: widget.textAlign,
      obscureText: _obscured,
      maxLength: widget.maxLength,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      onSubmitted: widget.onSubmitted,
      style: const TextStyle(fontSize: 15, color: CustomColors.ink),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        helperText: widget.helperText,
        errorText: widget.errorText,
        filled: true,
        fillColor: widget.enabled
            ? CustomColors.white
            : CustomColors.neutral100,
        prefixIcon: widget.prefixIcon == null
            ? null
            : Icon(widget.prefixIcon, size: 20, color: CustomColors.neutral500),
        suffixIcon: _buildSuffix(),
        counterText: '',
        errorStyle: const TextStyle(fontSize: 12, letterSpacing: 0.2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColors.neutral200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColors.neutral200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColors.brand, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: CustomColors.error, width: 1.6),
        ),
      ),
    );
  }
}
''';
}
