import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_notes/views/home/home.dart';

import '../common/constants.dart';
import '../widgets/foodCard.dart';

class FoodCategory extends StatefulWidget {
  final String name;
  final int index;
  const FoodCategory({
    super.key,
    required this.name,
    required this.index,
  });

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: BackButton(
            color: AppColors.black,
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Home()),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.black,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 20,
          //     vertical: 10,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: () => Navigator.of(context).pushReplacement(
          //           MaterialPageRoute(builder: (context) => const Home()),
          //         ),
          //         child: Container(
          //           padding: const EdgeInsets.all(10),
          //           decoration: BoxDecoration(
          //             border: Border.all(color: AppColors.lightGray),
          //             borderRadius: BorderRadius.circular(10),
          //           ),
          //           child: const Icon(
          //             Icons.chevron_left,
          //             color: AppColors.black,
          //           ),
          //         ),
          //       ),
          //       CustomLabel(
          //         label: widget.name,
          //         textColor: AppColors.black,
          //         fontWeight: FontWeight.w600,
          //         fontSize: 18,
          //       ),
          //     ],
          //   ),
          // ),
          Column(
            children: List.generate(
              categories[widget.index]['items'].length,
              (index) => FoodCard(
                index: index,
                food: categories[widget.index]['items'][index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
