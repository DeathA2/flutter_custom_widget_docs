import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';

import 'usage_doc_widget.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';

List<WidgetPreview> renderPreview({
  required String title,
  required String description,
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

  final _preview = WidgetPreview(
    widget: widget,
    description: '''
  $description
    ''',
  );

  final _usage = WidgetPreview(
    widget: UsageDocWidget(
      title: "use:",
      content: '''
   $code
  ''',
    ),
  );
  return [_title, _preview, _usage];
}
