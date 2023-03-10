import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/widgets/categoryCard.dart';
import 'package:flutter_notes/views/widgets/foodCard.dart';
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
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0,
                ),
                child: CategoryCard(
                  index: index,
                  name: 'Pizza',
                  image: 'assets/images/pizza.svg',
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
            children: List.generate(10, (index) => FoodCard()),
          )
        ],
      ),
    );
  }
}
