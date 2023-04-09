import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/cart/cart.dart';

import '../common/colors.dart';
import '../common/widgets/customLabel.dart';

class Coupon extends StatefulWidget {
  const Coupon({super.key});

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  final items = List<String>.generate(10, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const CustomLabel(
          label: "Coupons",
          textColor: AppColors.black,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
          fontSize: 18,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Cart()),
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
      body: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (contex, index) => Card(
          elevation: 2,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            color: AppColors.primary,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.only(
                              left: 6,
                              right: 6,
                              top: 5,
                              bottom: 5,
                            ),
                            child: const CustomLabel(
                              label: "RS1SC",
                              textColor: AppColors.white,
                            ),
                          ),
                          const CustomLabel(
                            label: "SPICY CHICKEN PIZZA FOR RS.1",
                            textColor: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: const CustomLabel(
                          label:
                              "Get Regular Pizza Mania Spicy Chicken Pizza for Rs.1 for orders above Rs.1499",
                          textColor: AppColors.black,
                          textOverflow: TextOverflow.visible,
                          textAlign: TextAlign.start,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.040,
                child: Container(
                  color: AppColors.lighterGray,
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomLabel(
                        label: "T & C",
                        textColor: AppColors.primary,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.w600,
                      ),
                      CustomLabel(
                        label: "APPLY",
                        textColor: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins-Regular',
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
