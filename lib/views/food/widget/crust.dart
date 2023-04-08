import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class Crust extends StatefulWidget {
  final int index;
  final int selectedCrust;
  final String crustName;
  final Function()? onChanged;

  const Crust({
    super.key,
    required this.index,
    required this.selectedCrust,
    required this.crustName,
    required this.onChanged,
  });

  @override
  State<Crust> createState() => _CrustState();
}

class _CrustState extends State<Crust> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged!(),
      child: Padding(
        padding: EdgeInsets.only(left: widget.index == 0 ? 10 : 0),
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
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: AppColors.primary,
            ),
            color: widget.selectedCrust == widget.index
                ? AppColors.primary
                : AppColors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
                color: Colors.grey,
              ),
            ],
          ),
          child: CustomLabel(
            label: widget.crustName,
            textColor: widget.selectedCrust == widget.index
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      ),
    );
  }
}
