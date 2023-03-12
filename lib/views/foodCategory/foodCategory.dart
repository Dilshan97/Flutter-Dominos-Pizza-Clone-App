import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/home/home.dart';

import '../widgets/foodCard.dart';

class FoodCategory extends StatefulWidget {
  final String name;
  const FoodCategory({
    super.key,
    required this.name,
  });

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Home()),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGray),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.chevron_left),
                  ),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins-Regular',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Column(
            children: List.generate(
              10,
              (index) => FoodCard(
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }
}
