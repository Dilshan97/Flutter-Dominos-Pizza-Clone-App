import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CustomLabel(
          label: "Your Cart is Empty",
          textColor: AppColors.black,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          fontFamily: 'Poppins-SemiBold',
        ),
        CustomLabel(
          label: "Look like you haven't added \n anything to your cart yet",
          textColor: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins-Light',
        )
      ],
    );
  }
}
