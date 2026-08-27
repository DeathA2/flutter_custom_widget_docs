import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/images/sliver_image_header.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/manual_documentation.dart';

final _documentation = ManualDocumentation(
  name: 'SliverImageHeader',
  properties: [
    PropertyDoc(name: 'title', type: 'String', isRequired: true, isNamed: true),
    PropertyDoc(
      name: 'imageUrl',
      type: 'String?',
      isRequired: true,
      isNamed: true,
      description:
          'Null or empty falls back to a flat background, with no load attempted.',
    ),
    PropertyDoc(
      name: 'expandedHeight',
      type: 'double',
      isRequired: false,
      isNamed: true,
      defaultValue: '180',
    ),
    PropertyDoc(
      name: 'leading',
      type: 'Widget?',
      isRequired: false,
      isNamed: true,
    ),
    PropertyDoc(
      name: 'actions',
      type: 'List<Widget>?',
      isRequired: false,
      isNamed: true,
    ),
    PropertyDoc(
      name: 'background',
      type: 'Color',
      isRequired: false,
      isNamed: true,
      defaultValue: 'CustomColors.white',
    ),
  ],
);

final sliverImageHeaderPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Sliver Image Header",
  description:
      "Image header that collapses as the page scrolls, for use inside `CustomScrollView.slivers`. The AppBar title and background *cross-fade* with the scroll fraction rather than switching at a threshold — a jump at exactly 70% reads as a rendering bug. The fraction is measured against the real collapse range (`maxExtent - minExtent`), not `expandedHeight`, or the title would never reach full opacity.",
  dependencies: _documentation.dependencies,
  code: r'''
CustomScrollView(
  slivers: [
    SliverPersistentHeader(
      pinned: true,
      delegate: SliverImageHeader(
        title: 'Article',
        imageUrl: 'https://example.com/cover.jpg',
      ),
    ),
  ],
),
  ''',
  widget: DeviceFrameSwitcher(
    child: CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverImageHeader(
            title: 'Article',
            imageUrl: 'https://picsum.photos/seed/cover/800/500',
            expandedHeight: 200,
          ),
        ),
        SliverList.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int i) =>
              const ListTile(title: Text('A paragraph of body copy')),
        ),
      ],
    ),
  ),
  widgetCode: r'''
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/images/network_image_view.dart';

/// Image header that collapses as the page scrolls, for `CustomScrollView.slivers`.
class SliverImageHeader extends SliverPersistentHeaderDelegate {
  SliverImageHeader({
    required this.title,
    required this.imageUrl,
    this.expandedHeight = 180,
    this.leading,
    this.actions,
    this.background = CustomColors.white,
  });

  final String title;
  final String? imageUrl;
  final double expandedHeight;
  final Widget? leading;
  final List<Widget>? actions;
  final Color background;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double t = (shrinkOffset / (maxExtent - minExtent)).clamp(0.0, 1.0);

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        NetworkImageView(imageUrl, fit: BoxFit.cover),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color(0x66000000), Color(0x00000000)],
              stops: <double>[0, 0.6],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              backgroundColor: background.withValues(alpha: t),
              elevation: 0,
              leading: leading,
              actions: actions,
              iconTheme: IconThemeData(
                color: Color.lerp(CustomColors.white, CustomColors.ink, t),
              ),
              title: Opacity(
                opacity: ((t - 0.5) * 2).clamp(0.0, 1.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: CustomColors.ink,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverImageHeader old) =>
      old.title != title ||
      old.imageUrl != imageUrl ||
      old.expandedHeight != expandedHeight ||
      old.background != background;
}
  ''',
);
