import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.discount,
          color: AppColors.black,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomLabel(
              label: "Apply Coupon",
              textColor: AppColors.black,
            ),
            CustomLabel(
              label: "Get discount with your order",
              textColor: AppColors.black,
            )
          ],
        ),
        const Icon(
          Icons.chevron_right,
          color: AppColors.black,
        ),
      ],
    );
  }
}
