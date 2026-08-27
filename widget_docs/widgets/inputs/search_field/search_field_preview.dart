import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/inputs/search_field.dart';
import 'package:flutter_custom_widget_docs/widgets/inputs/search_field.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = SearchFieldDocWidget();

final searchFieldPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Search Field",
  description:
      "Rounded search field with a magnifier on the left and a clear button that only appears once there is text — a clear button on an empty field is a tap target that does nothing. No debounce, on purpose: filtering happens in memory, so there is no round trip for a fast typist to outrun and a debounce would only make results arrive later.",
  dependencies: _documentation.dependencies,
  code: r'''
SearchField(
  value: value,
  onChanged: (v) => setState(() => value = v),
  hint: 'Search entries…',
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<String>(
      initial: '',
      builder: (BuildContext context, String value, ValueChanged<String> set) =>
          DemoSurface(
            child: SearchField(
              value: value,
              onChanged: set,
              hint: 'Search entries…',
            ),
          ),
    ),
  ),
  widgetCode: r'''
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';

/// Search field with a magnifier on the left and a clear button on the right.
@docWidget
class SearchField extends StatefulWidget {
  const SearchField({
    required this.value,
    required this.onChanged,
    this.hint = 'Search',
    super.key,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final String hint;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.value,
  );

  @override
  void didUpdateWidget(covariant SearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (String text) {
        widget.onChanged(text);
        setState(() {});
      },
      textInputAction: TextInputAction.search,
      style: const TextStyle(fontSize: 15, color: CustomColors.ink),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: CustomColors.white,
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: CustomColors.neutral400,
          fontSize: 15,
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 20,
          color: CustomColors.neutral400,
        ),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.close_rounded, size: 18),
                color: CustomColors.neutral400,
                tooltip: 'Clear search',
                onPressed: () {
                  _controller.clear();
                  widget.onChanged('');
                  setState(() {});
                },
              ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: CustomColors.neutral200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: CustomColors.neutral200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: CustomColors.brand, width: 1.5),
        ),
      ),
    );
  }
}
  ''',
);
