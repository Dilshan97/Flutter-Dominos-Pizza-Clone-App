import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/models/food.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';

import '../food/foodItem.dart';

class FoodCard extends StatefulWidget {
  final int index;
  final Map<String, dynamic> food;
  // final Food food;
  const FoodCard({
    super.key,
    required this.index,
    required this.food,
  });

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => FoodItem(
              food: widget.food,
            ),
          ),
        )
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 25,
          top: 25,
          left: 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.lighterGray,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width / 2.2,
                        child: CustomLabel(
                          label: widget.food['name'],
                          textColor: AppColors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.42,
                        child: CustomLabel(
                          label: widget.food['desc'],
                          textColor: AppColors.black,
                          fontSize: 10,
                          fontFamily: 'Poppins-Regular',
                          textOverflow: TextOverflow.clip,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 20,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 12,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomLabel(
                            label: "5.0",
                            textColor: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              transform: Matrix4.translationValues(
                30.0,
                25.0,
                0.0,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                    )
                  ]),
              child: Hero(
                tag: "pizza_${widget.index}",
                child: Image.asset(
                  widget.food['image'],
                  width: size.width / 2.8,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
