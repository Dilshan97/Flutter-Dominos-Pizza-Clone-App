import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(
            left: 10,
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/man.jpeg"),
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset("assets/images/menu.svg"),
          )
        ],
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
                const Text(
                  "Food",
                  style: TextStyle(
                    fontFamily: 'Poppins-Light',
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    height: 1.2,
                  ),
                ),
                const Text(
                  "Delivery",
                  style: TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                  ),
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
            child: Text(
              "Categories",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    top: 25,
                    bottom: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primary,
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.primary,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/images/pizza.svg",
                        width: 45,
                      ),
                      const Text(
                        "Pizza",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const RawMaterialButton(
                        onPressed: null,
                        fillColor: AppColors.white,
                        shape: CircleBorder(),
                        child: Icon(
                          Icons.chevron_right,
                          color: AppColors.secondary,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
