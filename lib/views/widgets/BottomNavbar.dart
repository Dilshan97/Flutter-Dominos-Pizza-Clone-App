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
        "assets/icons/navbar/home.svg",
        height: size.height * 0.040,
      ),
      SvgPicture.asset(
        "assets/icons/navbar/team.svg",
        height: size.height * 0.040,
      ),
      SvgPicture.asset(
        "assets/icons/navbar/home.svg",
        height: size.height * 0.040,
      ),
      SvgPicture.asset(
        "assets/icons/navbar/home.svg",
        height: size.height * 0.040,
      ),
      SvgPicture.asset(
        "assets/icons/navbar/home.svg",
        height: size.height * 0.040,
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
          title: Text(
            "1",
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
        ),
        BottomBarItem(
          icon: _activeIcons()[1],
          title: Text("2"),
        ),
        BottomBarItem(
          icon: _activeIcons()[2],
          title: Text("3"),
        ),
        BottomBarItem(
          icon: _activeIcons()[3],
          title: Text("4"),
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
