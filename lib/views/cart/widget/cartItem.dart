import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class CartItem extends StatefulWidget {
  final int index;
  final String dKey;
  const CartItem({
    super.key,
    required this.index,
    required this.dKey,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0.8,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Dismissible(
          key: Key(widget.dKey),
          background: Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              color: AppColors.tertiary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: const EdgeInsets.only(
                right: 5,
              ),
              child: const Icon(
                Icons.delete,
                color: AppColors.white,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {}
          },
          child: Container(
            margin: const EdgeInsets.only(
              left: 5,
              bottom: 10,
              right: 5,
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  "https://images.dominos.co.in/srilanka/toppingsTomato.jpg",
                  width: 80,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomLabel(
                      label: "Tandoori Chicken",
                      textColor: AppColors.black,
                    ),
                    const CustomLabel(
                      label: "Medium | Classic Hand Tossed",
                      textColor: AppColors.black,
                      fontFamily: 'Poppins-Regular',
                      fontSize: 13,
                    ),
                    const CustomLabel(
                      label: "Rs.2029.00",
                      textColor: AppColors.black,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _decrementQuantity,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(1),
                            child: const Icon(
                              Icons.remove,
                              color: AppColors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          child: CustomLabel(
                            label: _quantity.toString(),
                            textColor: AppColors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: _incrementQuantity,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(1),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
