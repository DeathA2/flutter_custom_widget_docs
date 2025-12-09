import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_custom_widget_docs/utils/strings.dart';

import 'usage_doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

List<WidgetPreview> renderPreview({
  required String title,
  required List<String> dependencies,
  required String description,
  required String widgetCode,
  required String code,
  required Widget widget,
}) {
  final _title = WidgetPreview(
    widget: Container(
      margin: const EdgeInsets.only(bottom: MarginApp.m12),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 26,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  final yamlText = formatDependenciesForPubspec(dependencies);

  final _dependencies = WidgetPreview(
    widget:
        yamlText.isEmpty
            ? SizedBox.shrink()
            : UsageDocWidget(
              title: "Widget's dependencies:",
              content: yamlText,
            ),
  );

  final _preview = WidgetPreview(
    widget: SizedBox.shrink(),
    description: '''
  $description
    ''',
  );

  final _sourceCode = WidgetPreview(
    widget: UsageDocWidget(
      title: "Widget's source code:",
      content: '''
    $widgetCode
  ''',
    ),
  );

  final _usage = WidgetPreview(
    widget: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: UsageDocWidget(
            title: "use:",
            content: '''
            $code
          ''',
          ),
        ),
        SizedBox(width: MarginApp.m8),
        widget,
      ],
    ),
  );
  if (widgetCode.isEmpty) return [_title, _preview, _dependencies, _usage];
  return [_title, _preview, _dependencies, _usage, _sourceCode];
}
