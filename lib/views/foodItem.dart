import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_svg/svg.dart';

import 'home/home.dart';

class FoodItem extends StatefulWidget {
  final Map food;
  const FoodItem({
    super.key,
    required this.food,
  });

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  late int selectedSize = 0;
  late int selectedCrust = 0;

  late String pizzaSize = "Regular";
  late String pizzaCrust = "Thin";
  late int pizzaPrice = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  onTap: () => {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const Home()),
                    )
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightGray),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.chevron_left_rounded),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.star,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 25,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food['name'],
                  style: const TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  widget.food['desc'],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                pizzaPrice != 0
                    ? Row(
                        children: [
                          SvgPicture.asset(
                            "assets/images/dollar.svg",
                            width: 15,
                            color: AppColors.tertiary,
                          ),
                          Text(
                            "${pizzaPrice}",
                            style: const TextStyle(
                              fontSize: 40,
                              fontFamily: 'Poppins-Regular',
                              fontWeight: FontWeight.w700,
                              color: AppColors.tertiary,
                              height: 1,
                            ),
                          )
                        ],
                      )
                    : Text(""),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Size",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.lightGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${pizzaSize}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Crust",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.lightGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${pizzaCrust}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Delivery In",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.lightGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Text(
                            "30 min",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Hero(
                        tag: widget.food['image'],
                        child: Container(
                          transform: Matrix4.translationValues(
                            2.0,
                            25.0,
                            0.0,
                          ),
                          height: 200,
                          width: size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.lightGray,
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: Image.asset(
                            widget.food['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 50,
            ),
            child: Text(
              "Sizes",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.food['sizes'].length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedSize = index;
                    selectedCrust = 0;
                    pizzaSize = widget.food['sizes'][index]['name'];
                    pizzaPrice = widget.food['sizes'][index]['price'];
                  })
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 10 : 0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedSize == index
                          ? AppColors.secondary
                          : AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                          ),
                          child: SvgPicture.asset(
                            widget.food['sizes'][index]['image'],
                            width: 70,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.food['sizes'][index]['name']}",
                              style: TextStyle(
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w700,
                                color: selectedSize == index
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            Text(
                              "${widget.food['sizes'][index]['desc']}",
                              style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                color: selectedSize == index
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              "Crust",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.food['sizes'][selectedSize]['crust'].length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedCrust = index;
                    pizzaCrust = widget.food['sizes'][selectedSize]['crust']
                        [index]['name'];
                  })
                },
                child: Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 10 : 0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedCrust == index
                          ? AppColors.secondary
                          : AppColors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 1,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: CustomLabel(
                      label: widget.food['sizes'][selectedSize]['crust'][index]
                          ['name'],
                      textColor: selectedCrust == index
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: SizedBox(
      //   width: size.width,
      //   child: GestureDetector(
      //     child: Container(
      //       margin: const EdgeInsets.only(
      //         left: 30,
      //         right: 30,
      //       ),
      //       decoration: const BoxDecoration(
      //         color: AppColors.primary,
      //         borderRadius: BorderRadius.only(
      //           topRight: Radius.circular(25),
      //           topLeft: Radius.circular(25),
      //         ),
      //       ),
      //       child: const Padding(
      //         padding: EdgeInsets.only(
      //           top: 20,
      //           bottom: 22,
      //         ),
      //         child: Text(
      //           'Add to Cart',
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontFamily: 'Poppins-Regular',
      //             fontWeight: FontWeight.w700,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
