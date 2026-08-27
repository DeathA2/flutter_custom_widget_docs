import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/inputs/app_text_field.dart';
import 'package:flutter_custom_widget_docs/widgets/inputs/app_text_field.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = AppTextFieldDocWidget();

final appTextFieldPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "App Text Field",
  description:
      "Controlled text field: the value comes in through `value`, every change goes out through `onChanged`, so the state lives in exactly one place. The subtle part is `didUpdateWidget` — assigning straight to `_controller.text` when outside state pushes a new value collapses the caret to offset 0 on some engines, so the next keystroke lands at the *start* of the string. Here the caret position is preserved and only clamped when it exceeds the new length. Suffixes build themselves: a clear button while there is text, a reveal toggle when `obscureText` is on, with the \"revealed\" flag kept local rather than in bloc state.",
  dependencies: _documentation.dependencies,
  code: r'''
AppTextField(
  value: value,
  label: 'Email',
  hint: 'you@example.com',
  onChanged: (v) => setState(() => value = v),
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<String>(
      initial: '',
      builder: (BuildContext context, String value, ValueChanged<String> set) =>
          DemoSurface(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  value: value,
                  label: 'Email',
                  hint: 'you@example.com',
                  prefixIcon: Icons.mail_outline_rounded,
                  helperText: 'Used to recover your password',
                  clearable: true,
                  onChanged: set,
                ),
                const SizedBox(height: 20),
                AppTextField(
                  value: 'not-a-number',
                  label: 'Phone number',
                  errorText: 'That phone number is not valid',
                  onChanged: (_) {},
                ),
                const SizedBox(height: 20),
                AppTextField(
                  value: 'Read only',
                  label: 'Patient ID',
                  readOnly: true,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
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
  ''',
);
