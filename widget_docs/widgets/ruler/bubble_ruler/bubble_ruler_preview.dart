import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/rulers/bubble_ruler.dart';
import 'package:flutter_custom_widget_docs/widgets/rulers/bubble_ruler.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = BubbleColorBarDocWidget();

final bubbleColorBarPreview = ElementPreview(
  document: documentation,
  previews: [..._defaultRuler],
);

// Default
final _defaultRuler = renderPreview(
  title: "I. Bubble bar",
  description: "Using for display horizontal domain chart",
  dependencies: documentation.dependencies,
  code: '''
BubbleColorBar(
    showBubble: true,
    showMarker: true,
    isCel: true,
    barType: BarType.spO2,
    value: 97,
  )
''',
  widget: DeviceFrameSwitcher(
    child: BubbleColorBar(
      showBubble: true,
      showMarker: true,
      isCel: true,
      barType: BarType.spO2,
      value: 97,
    ),
  ),
  widgetCode: documentation.source,
);
