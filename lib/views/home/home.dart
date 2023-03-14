import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/constants.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_notes/views/splash.dart';
import 'package:flutter_notes/views/widgets/foodCard.dart';
import 'package:flutter_svg/svg.dart';

import 'widget/categoryCard.dart';
import 'widget/nav/navItem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _drawerOpen = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  signout() {
    auth.signOut();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Splash(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(
            left: 0,
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/man.jpeg"),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
              icon: _drawerOpen
                  ? const Icon(
                      Icons.restaurant_menu_outlined,
                      color: AppColors.secondary,
                    )
                  : SvgPicture.asset("assets/images/menu.svg"),
            ),
          )
        ],
      ),
      endDrawer: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
          bottomLeft: Radius.circular(100),
        ),
        child: Drawer(
          backgroundColor: AppColors.white,
          child: Container(
            height: 200,
            child: Column(
              children: [
                // Drawer items
                SizedBox(
                  height: size.height * 0.18,
                  child: Container(
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                NavItem(
                  icon: Icons.location_pin,
                  name: 'Track Current Order',
                  width: size.width,
                ),

                NavItem(
                  icon: Icons.history,
                  name: 'Order History',
                  width: size.width,
                ),

                NavItem(
                  icon: Icons.menu_book,
                  name: 'Menu',
                  width: size.width,
                ),

                NavItem(
                  icon: Icons.heat_pump_sharp,
                  name: 'My Favorite',
                  width: size.width,
                ),

                NavItem(
                  icon: Icons.receipt,
                  name: 'Terms & Conditions',
                  width: size.width,
                ),

                NavItem(
                  icon: Icons.contact_phone,
                  name: 'Help',
                  width: size.width,
                ),

                NavItem(
                  icon: Icons.logout,
                  name: 'Sign out',
                  width: size.width,
                  onTap: () => signout(),
                ),
              ],
            ),
          ),
        ),
      ),
      onEndDrawerChanged: (onDrawerChanged) => setState(
        () {
          _drawerOpen = onDrawerChanged;
        },
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLabel(
                  label: "Food",
                  fontFamily: 'Poppins-Light',
                  textColor: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  height: 1.2,
                ),
                const CustomLabel(
                  label: "Delivery",
                  textColor: AppColors.black,
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: size.height * 0.050,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: CustomLabel(
              label: "Categories",
              textAlign: TextAlign.start,
              textColor: AppColors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: size.height * 0.30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                ),
                child: CategoryCard(
                  index: index,
                  name: "${categories[index]['name']}",
                  image: '${categories[index]['imagePath']}',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          Column(
            children: List.generate(
              categories[0]['items'].length,
              (index) => FoodCard(
                index: index,
                food: categories[0]['items'][index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
