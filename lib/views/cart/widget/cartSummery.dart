import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class CartSummery extends StatefulWidget {
  final String title;
  final double price;
  final FontWeight? fontWeight;
  const CartSummery({
    super.key,
    required this.title,
    required this.price,
    this.fontWeight,
  });

  @override
  State<CartSummery> createState() => _CartSummeryState();
}

class _CartSummeryState extends State<CartSummery> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomLabel(
          label: widget.title,
          textAlign: TextAlign.start,
          textColor: AppColors.black,
          height: 2,
          fontFamily: 'Poppins-Regular',
          fontWeight: widget.fontWeight,
          fontSize: 16,
        ),
        CustomLabel(
          label: "Rs.${widget.price}",
          textColor: AppColors.black,
          height: 2,
          fontFamily: 'Poppins-Regular',
          fontWeight: widget.fontWeight,
          fontSize: 16,
        ),
      ],
    );
  }
}
