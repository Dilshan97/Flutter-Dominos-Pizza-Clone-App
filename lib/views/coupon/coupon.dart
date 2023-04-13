import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/cart/cart.dart';

import '../common/colors.dart';
import '../common/constants.dart';
import '../common/widgets/customLabel.dart';
import 'widget/couponItem.dart';

class Coupon extends StatefulWidget {
  const Coupon({super.key});

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  bool _showBottomSheet = true;

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
        itemCount: coupons.length,
        itemBuilder: (contex, index) => CouponItem(
          title: coupons[index]['title'],
          desc: coupons[index]['desc'],
          couponCode: coupons[index]['coupon_code'],
          onTap: () => bottomSheet(context, coupons[index]['terms']),
        ),
      ),
    );
  }
}

void bottomSheet(context, terms) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: size.height / 2,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
            bottom: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: const CustomLabel(
                  label: "Terms & Conditions",
                  textColor: AppColors.black,
                  fontSize: 18,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: terms.length,
                itemBuilder: (context, index) => CustomLabel(
                  label: "- ${terms[index]}",
                  textColor: AppColors.black,
                  textAlign: TextAlign.start,
                  fontFamily: 'Poppins-Regular',
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
