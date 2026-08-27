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
