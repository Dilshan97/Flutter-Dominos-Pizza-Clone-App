import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/colors.dart';

class PizzaSize extends StatefulWidget {
  final int index;
  final String title;
  final String subTitle;
  final String image;
  final int selectedSize;
  final Function()? onChanged;

  const PizzaSize(
      {super.key,
      required this.index,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.selectedSize,
      required this.onChanged});

  @override
  State<PizzaSize> createState() => _PizzaSizeState();
}

class _PizzaSizeState extends State<PizzaSize> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged!(),
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.index == 0 ? 10 : 0,
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
            color: widget.selectedSize == widget.index
                ? AppColors.primary
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
                  widget.image,
                  width: 70,
                  color: widget.selectedSize == widget.index
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.w700,
                      color: widget.selectedSize == widget.index
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                  Text(
                    widget.subTitle,
                    style: TextStyle(
                      fontFamily: 'Poppins-Regular',
                      color: widget.selectedSize == widget.index
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
    );
  }
}
