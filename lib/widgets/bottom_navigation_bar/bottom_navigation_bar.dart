import 'package:doc_widget/doc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_widget_docs/gen/assets.gen.dart';
import 'package:flutter_custom_widget_docs/rsc/colors/color_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/fonts/font_manager.dart';
import 'package:flutter_custom_widget_docs/rsc/styles/text_style.dart';
import 'package:flutter_custom_widget_docs/rsc/values/values_manager.dart';
import 'package:flutter_svg/svg.dart';

@docWidget
class BottomNavigationBarCustom extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;
  const BottomNavigationBarCustom({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  Widget _renderIcon(String _imagePath, Color _color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingApp.p6),
      child: SvgPicture.asset(
        _imagePath,
        colorFilter: ColorFilter.mode(_color, BlendMode.srcIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsApp.white,
      currentIndex: selectedIndex,
      elevation: ElevationApp.ev16,
      iconSize: SizeApp.s20,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: _renderIcon(Assets.svg.homeStroke, ColorsApp.greyIcon),
          activeIcon: _renderIcon(Assets.svg.home, ColorsApp.bluePrimary),
          label: "Home",
          tooltip: '', // disable tooltip
        ),
        BottomNavigationBarItem(
          icon: _renderIcon(Assets.svg.deviceStroke, ColorsApp.greyIcon),

          activeIcon: _renderIcon(Assets.svg.device, ColorsApp.bluePrimary),
          label: "Devices",
          tooltip: '', // disable tooltip
        ),
        BottomNavigationBarItem(
          icon: _renderIcon(Assets.svg.icServicesStroke, ColorsApp.greyIcon),

          activeIcon: _renderIcon(Assets.svg.icServices, ColorsApp.bluePrimary),
          label: "Services",
          tooltip: '', // disable tooltip
        ),
        BottomNavigationBarItem(
          icon: _renderIcon(Assets.svg.userStroke, ColorsApp.greyIcon),
          activeIcon: _renderIcon(Assets.svg.user, ColorsApp.bluePrimary),
          label: "Profile",
          tooltip: '', // disable tooltip
        ),
      ],
      onTap: onItemTapped,
      selectedItemColor: ColorsApp.bluePrimary, // need this
      selectedLabelStyle: TextStylesApp.medium(
        color: ColorsApp.bluePrimary, // this has no effect
        fontSize: FontSizeApp.s12,
      ),
      unselectedItemColor: ColorsApp.greyIcon, // need this
      unselectedLabelStyle: TextStylesApp.medium(
        color: ColorsApp.greyIcon, // this has no effect
        fontSize: FontSizeApp.s12,
      ),
    );
  }
}
