import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';

class FoodCard extends StatefulWidget {
  const FoodCard({super.key});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => {},
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
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "top of the week",
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: size.width / 2.2,
                        child: const Text(
                          "Primavera Pizza",
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Text(
                        "weight 450 gr",
                        style: TextStyle(
                          fontFamily: 'Poppins-Regular',
                          fontSize: 14,
                          color: AppColors.lightGray,
                        ),
                      )
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
                          Text(
                            "5.0",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
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
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                    )
                  ]),
              child: Hero(
                tag: "assets/images/pizza.png",
                child: Image.asset(
                  "assets/images/pizza.png",
                  width: size.width / 2.9,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
