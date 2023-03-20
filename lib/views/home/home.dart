import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/models/food.dart';
import 'package:flutter_notes/views/cart/cart.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/constants.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_notes/views/profile/profile.dart';
import 'package:flutter_notes/views/splash.dart';
import 'package:flutter_notes/views/widgets/foodCard.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/category.dart';
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

  final categoryRef =
      FirebaseFirestore.instance.collection('categories').withConverter(
            fromFirestore: Category.fromFirestore,
            toFirestore: (Category category, _) => category.toFirestore(),
          );

  final foodRef = FirebaseFirestore.instance.collection('foods').withConverter(
        fromFirestore: Food.fromFirestore,
        toFirestore: (Food food, _) => food.toFirestore(),
      );

  signout() {
    auth.signOut().then(
          (value) => {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Splash(),
              ),
            )
          },
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
        title: Padding(
          padding: const EdgeInsets.only(
            left: 0,
          ),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Profile(),
              ),
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/man.jpeg"),
            ),
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
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomLabel(
                  label: "Hello, Dilshan",
                  fontFamily: 'Poppins-Light',
                  textColor: AppColors.black,
                  height: 1.4,
                  fontSize: 16,
                ),
                SizedBox(
                  height: size.height * 0.010,
                ),
                const CustomLabel(
                  label: "Grab your delicious meal",
                  fontFamily: 'Poppins-Light',
                  textColor: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.2,
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
            child: StreamBuilder<QuerySnapshot<Category>>(
              stream: categoryRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                final data = snapshot.requireData;

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.size,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 20 : 0,
                    ),
                    child: CategoryCard(
                      index: index,
                      name: data.docs[index]['name'],
                      image: data.docs[index]['image'],
                    ),
                  ),
                );
              },
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
          SizedBox(
            height: size.height * 0.50,
            child: StreamBuilder<QuerySnapshot<Food>>(
              stream: foodRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                final data = snapshot.requireData;
                print(data.docs[0]);

                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: data.size,
                  itemBuilder: (contex, index) => FoodCard(
                    index: index,
                    food: categories[0]['items'][index],
                  ),
                );
              },
            ),
          ),
          // Column(s
          //   children: List.generate(
          //     categories[0]['items'].length,
          //     (index) => FoodCard(
          //       index: index,
          //       food: categories[0]['items'][index],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
