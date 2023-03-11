import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../common/colors.dart';
import '../../foodCategory/foodCategory.dart';

class CategoryCard extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  const CategoryCard({
    super.key,
    required this.name,
    required this.image,
    required this.index,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {selectedCategory = widget.index},
        )
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 20,
          top: 25,
          bottom: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selectedCategory == widget.index
              ? AppColors.primary
              : AppColors.white,
          boxShadow: [
            BoxShadow(
              color: selectedCategory == widget.index
                  ? AppColors.primary
                  : AppColors.lighterGray,
              blurRadius: 2,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              widget.image,
              width: 100,
            ),
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins-Regular',
              ),
            ),
            RawMaterialButton(
              onPressed: () => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const FoodCategory()),
                )
              },
              fillColor: selectedCategory == widget.index
                  ? AppColors.white
                  : AppColors.tertiary,
              shape: const CircleBorder(),
              child: Icon(
                Icons.chevron_right,
                color: selectedCategory == widget.index
                    ? AppColors.secondary
                    : AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
