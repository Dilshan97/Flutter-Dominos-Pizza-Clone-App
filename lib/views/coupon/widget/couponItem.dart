import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class CouponItem extends StatefulWidget {
  final String title;
  final String desc;
  final String couponCode;
  final Function() onTap;

  const CouponItem({
    super.key,
    required this.title,
    required this.desc,
    required this.couponCode,
    required this.onTap,
  });

  @override
  State<CouponItem> createState() => _CouponItemState();
}

class _CouponItemState extends State<CouponItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        color: AppColors.primary,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(
                          left: 6,
                          right: 6,
                          top: 5,
                          bottom: 5,
                        ),
                        child: CustomLabel(
                          label: widget.couponCode,
                          textColor: AppColors.white,
                        ),
                      ),
                      CustomLabel(
                        label: widget.title,
                        textColor: AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins-Regular',
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: CustomLabel(
                      label: widget.desc,
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
                children: [
                  GestureDetector(
                    onTap: () => widget.onTap!(),
                    child: const CustomLabel(
                      label: "T & C",
                      textColor: AppColors.primary,
                      fontFamily: 'Poppins-Regular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: const CustomLabel(
                      label: "APPLY",
                      textColor: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
