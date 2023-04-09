import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('item'),
    );
  }
}
