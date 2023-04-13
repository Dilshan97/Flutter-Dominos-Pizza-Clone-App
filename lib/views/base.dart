import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_notes/views/cart/cart.dart';
import 'package:flutter_notes/views/profile/profile.dart';
import 'package:flutter_svg/svg.dart';

import 'common/colors.dart';
import 'favourite/favourite.dart';
import 'home/home.dart';
import 'menu/menu.dart';
import 'widgets/BottomNavbar.dart';

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int currentIndex = 0;
  int currentTab = 0;
  DateTime? currentBackPressTime;
  late Size size;

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  List<Widget> _buildScreens() {
    return [
      const Home(),
      const Menu(),
      const Favourite(),
      const Profile(),
      const Cart(),
    ];
  }

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    if (currentTab != 0) {
      if (!(await _navigatorKeys[currentTab].currentState!.maybePop())) {
        setState(() {
          currentTab = 0;
          currentIndex = 0;
        });
        return Future.value(false);
      } else {
        return Future.value(false);
      }
    } else {
      if (!(await _navigatorKeys[currentTab].currentState!.maybePop())) {
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          // Fluttertoast.showToast(msg: "Press again to exit");
          return Future.value(false);
        }
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: Stack(
          children: [
            SizedBox(
              height: size.height,
              child: Navigator(
                key: _navigatorKeys[currentTab],
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => _buildScreens()[currentTab],
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              child: InkWell(
                onTap: () {
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  );
                },
                child: SizedBox(
                  width: size.width,
                  height: padding.bottom + kBottomNavigationBarHeight,
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(
            top: size.height * 0.015,
          ),
          child: FloatingActionButton(
            splashColor: AppColors.transparent,
            hoverColor: AppColors.transparent,
            focusColor: AppColors.transparent,
            backgroundColor: AppColors.primary,
            focusElevation: 0,
            highlightElevation: 0,
            elevation: 0,
            isExtended: true,
            onPressed: () {
              setState(() {
                currentTab = 4;
              });
            },
            child: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: AppColors.white,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavbar(
          currentIndex: currentIndex,
          currentTab: currentTab,
          onTap: (index) {
            setState(() {
              currentIndex = index!;
              currentTab = index;
            });
          },
        ),
      ),
    );
  }
}
