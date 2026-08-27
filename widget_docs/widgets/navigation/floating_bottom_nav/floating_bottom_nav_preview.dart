import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/widgets/navigation/floating_bottom_nav.dart';
import 'package:flutter_custom_widget_docs/widgets/navigation/floating_bottom_nav.doc_widget.dart';

import '../../preview/device_frame_switcher.dart';
import '../../preview/preview_screen.dart';
import '../../preview/demo_host.dart';

final _documentation = FloatingBottomNavDocWidget();

final floatingBottomNavPreview = ElementPreview(
  document: _documentation,
  previews: [..._previews],
);

final _previews = renderPreview(
  title: "Floating Bottom Nav",
  description:
      "Three layers back to front: a blob merging the tab stadium and the action circle into one shape through a pair of S-curves, a solid white pill holding the 64pt tab cells, and the round action button. The blob is filled with the exact page background behind it — the *shadow*, not a lighter colour, is what separates the layers. The silhouette is drawn from cubic segments rather than two shapes unioned together, because a union leaves two sharp cusps instead of the S-curved waist that is the whole point. Sizing is intrinsic, so cells stay exactly 64pt and a narrow screen scales the whole bar down rather than squeezing individual cells.",
  dependencies: _documentation.dependencies,
  code: r'''
FloatingBottomNav(
  destinations: const [
    NavDestination(icon: Icons.home_rounded, label: 'Home'),
    NavDestination(icon: Icons.bar_chart_rounded, label: 'Stats'),
  ],
  selectedIndex: index,
  onSelected: (i) => setState(() => index = i),
  onAction: () {},
),
  ''',
  widget: DeviceFrameSwitcher(
    child: DemoValue<int>(
      initial: 0,
      builder: (BuildContext context, int value, ValueChanged<int> set) =>
          Column(
            children: [
              const Spacer(),
              FloatingBottomNav(
                selectedIndex: value,
                onSelected: set,
                onAction: () {},
                actionLabel: 'Add entry',
                destinations: const [
                  NavDestination(icon: Icons.home_rounded, label: 'Home'),
                  NavDestination(
                    icon: Icons.bar_chart_rounded,
                    label: 'Stats',
                    badgeCount: 3,
                  ),
                  NavDestination(icon: Icons.person_rounded, label: 'Profile'),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
    ),
  ),
  widgetCode: r'''
import 'dart:math' as math;

import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/custom_color_manager.dart';
import 'package:flutter_custom_widget_docs/widgets/animation/touchable_opacity.dart';
import 'package:flutter_custom_widget_docs/widgets/selection/count_badge.dart';

/// One tab of a [FloatingBottomNav].
class NavDestination {
  const NavDestination({
    required this.icon,
    required this.label,
    this.badgeCount = 0,
  });

  final IconData icon;
  final String label;
  final int badgeCount;
}

const double _kNavBarHeight = 84;
const double _kNavRadius = _kNavBarHeight / 2;
const double _kNavRing = 6;
const double _kNavPillHeight = _kNavBarHeight - _kNavRing * 2;
const double _kNavCell = 64;
const double _kNavPillPad = 4;
const double _kNavJoin = 78;
const double _kNavFabSize = 72;
const double _kNavIcon = 22;
const double _kNavLabel = 10;
const double _kNavSideMargin = 16;
const double _kNavTopMargin = 8;

/// Floating bottom nav: a blob hugging a white pill of tabs, plus an optional
/// round button merged into its right end.
@docWidget
class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    this.onAction,
    this.actionLabel = 'Create',
    this.actionIcon = Icons.add_rounded,
    this.blobColor = CustomColors.canvas,
    super.key,
  });

  final List<NavDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  /// Null hides the action button, leaving the pill as the whole bar.
  final VoidCallback? onAction;

  final String actionLabel;
  final IconData actionIcon;

  /// Must match the page background. See the class docs.
  final Color blobColor;

  static double _pillWidth(int tabCount) =>
      tabCount * _kNavCell + _kNavPillPad * 2;

  /// Right edge of the blob, so the box and [_navShapePath] agree by construction.
  static double _intrinsicWidth(int tabCount, {required bool hasAction}) {
    final double stadium = _pillWidth(tabCount) + _kNavRing * 2;
    return hasAction ? stadium + _kNavJoin : stadium;
  }

  static double _scaleFor(
    BuildContext context, {
    required bool hasAction,
    required int tabCount,
  }) {
    final double available =
        MediaQuery.sizeOf(context).width - _kNavSideMargin * 2;
    final double intrinsic = _intrinsicWidth(tabCount, hasAction: hasAction);
    if (intrinsic <= 0) return 1;
    return math.min(1, available / intrinsic);
  }

  static double _bottomPad(BuildContext context) =>
      math.max(16, MediaQuery.paddingOf(context).bottom * 0.6);

  /// Height this bar occupies, including its own safe-area padding. The shell
  /// uses `extendBody: true`, so overlays and scroll padding inside a tab must
  /// clear this number.
  static double heightFor(
    BuildContext context, {
    bool hasAction = false,
    int tabCount = 4,
  }) {
    final double scale = _scaleFor(
      context,
      hasAction: hasAction,
      tabCount: tabCount,
    );
    return _kNavTopMargin + _kNavBarHeight * scale + _bottomPad(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool hasAction = onAction != null;
    final double scale = _scaleFor(
      context,
      hasAction: hasAction,
      tabCount: destinations.length,
    );
    final double pillWidth = _pillWidth(destinations.length);
    final double width = _intrinsicWidth(
      destinations.length,
      hasAction: hasAction,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        _kNavSideMargin,
        _kNavTopMargin,
        _kNavSideMargin,
        _bottomPad(context),
      ),
      child: SizedBox(
        height: _kNavBarHeight * scale,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: width,
            height: _kNavBarHeight,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: CustomPaint(
                    painter: _NavShapePainter(
                      pillWidth: pillWidth,
                      hasAction: hasAction,
                      fill: blobColor,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: _kNavRing),
                      Container(
                        width: pillWidth,
                        height: _kNavPillHeight,
                        padding: const EdgeInsets.all(_kNavPillPad),
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.circular(
                            _kNavPillHeight / 2,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            for (int i = 0; i < destinations.length; i++)
                              _NavItem(
                                destination: destinations[i],
                                selected: i == selectedIndex,
                                onTap: () {
                                  HapticFeedback.selectionClick();
                                  onSelected(i);
                                },
                              ),
                          ],
                        ),
                      ),
                      if (hasAction) ...<Widget>[
                        const SizedBox(width: _kNavRing),
                        _NavActionButton(
                          label: actionLabel,
                          icon: actionIcon,
                          onTap: onAction!,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final NavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color fg = selected ? CustomColors.brand : CustomColors.neutral500;

    return SizedBox(
      width: _kNavCell,
      child: TouchableOpacity.scale(
        pressedScale: 0.94,
        isButton: true,
        semanticsLabel: destination.badgeCount > 0
            ? '${destination.label}, ${destination.badgeCount} new items'
            : destination.label,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          height: _kNavCell,
          decoration: BoxDecoration(
            color: selected ? CustomColors.brandSoft : Colors.transparent,
            borderRadius: BorderRadius.circular(_kNavCell / 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Icon(destination.icon, size: _kNavIcon, color: fg),
                  if (destination.badgeCount > 0)
                    Positioned(
                      right: -8,
                      top: -4,
                      child: CountBadge(
                        count: destination.badgeCount,
                        compact: true,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                destination.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: _kNavLabel,
                  height: 1.3,
                  fontWeight: FontWeight.w800,
                  color: fg,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavActionButton extends StatelessWidget {
  const _NavActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity.scale(
      pressedScale: 0.94,
      isButton: true,
      semanticsLabel: label,
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: Container(
        width: _kNavFabSize,
        height: _kNavFabSize,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.707, -0.707),
            end: Alignment(0.707, 0.707),
            colors: CustomColors.tealPrimary,
          ),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: _kNavIcon, color: CustomColors.white),
            const SizedBox(height: 3),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: _kNavLabel,
                height: 1.3,
                fontWeight: FontWeight.w800,
                color: CustomColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Silhouette of the blob — a stadium around the pill, optionally merged into
/// a circle around the action button.
Path _navShapePath({required double pillWidth, required bool hasAction}) {
  const double h = _kNavBarHeight;
  const double r = _kNavRadius;
  final double stadiumWidth = pillWidth + _kNavRing * 2;
  final Rect stadium = Rect.fromLTWH(0, 0, stadiumWidth, h);

  if (!hasAction) {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(stadium, const Radius.circular(r)));
  }

  final double j = stadiumWidth - r;
  final double cx = j + _kNavJoin;

  return Path()
    ..moveTo(j, 0)
    ..cubicTo(j + 14.13, 0, j + 26.64, 6.98, j + 34.25, 17.68)
    ..cubicTo(j + 36.35, 20.64, j + 41.77, 20.64, j + 43.86, 17.68)
    ..cubicTo(j + 51.48, 6.98, j + 63.98, 0, cx, 0)
    ..arcToPoint(Offset(cx, h), radius: const Radius.circular(r))
    ..cubicTo(j + 63.98, h, j + 51.48, h - 6.98, j + 43.86, h - 17.68)
    ..cubicTo(j + 41.77, h - 20.64, j + 36.35, h - 20.64, j + 34.25, h - 17.68)
    ..cubicTo(j + 26.64, h - 6.98, j + 14.13, h, j, h)
    ..lineTo(r, h)
    ..arcToPoint(const Offset(r, 0), radius: const Radius.circular(r))
    ..close();
}

/// Draws the blob: shadow first, then a flat fill.
class _NavShapePainter extends CustomPainter {
  const _NavShapePainter({
    required this.pillWidth,
    required this.hasAction,
    required this.fill,
  });

  final double pillWidth;
  final bool hasAction;
  final Color fill;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = _navShapePath(pillWidth: pillWidth, hasAction: hasAction);

    canvas.save();
    canvas.translate(0, 6);
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.black.withValues(alpha: 0.10)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );
    canvas.restore();

    canvas.drawPath(path, Paint()..color = fill);
  }

  @override
  bool shouldRepaint(covariant _NavShapePainter old) =>
      old.pillWidth != pillWidth ||
      old.hasAction != hasAction ||
      old.fill != fill;
}
  ''',
);
