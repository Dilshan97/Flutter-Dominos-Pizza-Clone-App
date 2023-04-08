import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class ToppingItem extends StatefulWidget {
  final int index;
  final String image;
  final String name;
  final Function()? onChanged;
  final bool isSelected;

  const ToppingItem({
    super.key,
    required this.index,
    required this.name,
    required this.image,
    required this.onChanged,
    required this.isSelected,
  });

  @override
  State<ToppingItem> createState() => _ToppingItemState();
}

class _ToppingItemState extends State<ToppingItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {widget.onChanged!()},
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter: widget.isSelected
                  ? ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    )
                  : ColorFilter.mode(
                      Colors.black.withOpacity(0.2),
                      BlendMode.color,
                    ),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                width: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomLabel(
              label: widget.name,
              textColor: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
