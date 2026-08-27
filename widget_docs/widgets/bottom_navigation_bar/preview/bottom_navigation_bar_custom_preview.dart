import 'package:doc_widget/doc_widget.dart';
import 'package:flutter_custom_widget_docs/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:flutter_custom_widget_docs/widgets/bottom_navigation_bar/bottom_navigation_bar.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';

final documentation = BottomNavigationBarCustomDocWidget();

final bottomNavigationBarPreview = ElementPreview(
  document: documentation,
  previews: [..._bottomNavigationBarPreview],
);

final _bottomNavigationBarPreview = renderPreview(
  title: "Bottom Navigation Bar Biocare",
  dependencies: documentation.dependencies,
  widgetCode: documentation.source,
  description:
      '''A widget display in bottom of Biocare app, it has 4 icons for 4 pages: Home, Device, Service, and Profile.
      
You can not interact with it on web platform, because it's just a image.''',
  code: '''
child: BottomNavigationBarCustom(
      selectedIndex: 2,
      onItemTapped: (value) {},
    ),
    ''',
  widget: DeviceFrameSwitcher(
    child: BottomNavigationBarCustom(
      selectedIndex: 2,
      onItemTapped: (value) {},
    ),
  ),
);
