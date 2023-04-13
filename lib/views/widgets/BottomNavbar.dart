import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavbar extends StatefulWidget {
  final int currentIndex;
  final int currentTab;
  final Function(int)? onTap;

  const BottomNavbar({
    super.key,
    required this.currentIndex,
    required this.currentTab,
    this.onTap,
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late Size size;
  List<Widget> _activeIcons() {
    return [
      SvgPicture.asset(
        "assets/icons/home.svg",
        height: size.height * 0.030,
        color: AppColors.primary,
      ),
      SvgPicture.asset(
        "assets/icons/menu.svg",
        height: size.height * 0.030,
        color: AppColors.primary,
      ),
      SvgPicture.asset(
        "assets/icons/fav.svg",
        height: size.height * 0.030,
        color: AppColors.primary,
      ),
      SvgPicture.asset(
        "assets/icons/user.svg",
        height: size.height * 0.030,
        color: AppColors.primary,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return StylishBottomBar(
      elevation: size.height * 0.025,
      option: AnimatedBarOptions(
        barAnimation: BarAnimation.fade,
        iconStyle: IconStyle.simple,
      ),
      items: [
        BottomBarItem(
          icon: _activeIcons()[0],
          title: const Text(""),
        ),
        BottomBarItem(
          icon: _activeIcons()[1],
          title: const Text(""),
        ),
        BottomBarItem(
          icon: _activeIcons()[2],
          title: const Text(""),
        ),
        BottomBarItem(
          icon: _activeIcons()[3],
          title: const Text(""),
        ),
      ],
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      currentIndex: widget.currentIndex,
      onTap: (index) {
        setState(() {
          widget.onTap!(index);
        });
      },
    );
  }
}
