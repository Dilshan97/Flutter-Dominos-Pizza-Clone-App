import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';

import '../common/widgets/customLabel.dart';
import '../home/home.dart';
import 'widget/cartItem.dart';
import 'widget/cartSummery.dart';
import 'widget/discount.dart';
import 'widget/emptyCart.dart';
import 'widget/frequentItem.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        title: const CustomLabel(
          label: "Cart",
          textColor: AppColors.black,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.start,
          fontSize: 18,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 25,
          ),
          child: GestureDetector(
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Home()),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: Icon(
                Icons.shopping_cart,
                color: AppColors.black,
              ),
            ),
          )
        ],
      ),
      body: items.isNotEmpty
          ? ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: size.height / 2,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (context, index) => CartItem(
                      dKey: items[index],
                      index: index,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomLabel(
                        label: "Frequently Bought Together",
                        textColor: AppColors.black,
                      ),
                      CustomLabel(
                        label: "EXPLORE MENU",
                        textColor: AppColors.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: 129,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) => const FrequentItem(),
                  ),
                ),
                SizedBox(
                  width: size.width,
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 20,
                    ),
                    child: const Discount(),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  width: size.width,
                  child: Card(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CartSummery(
                          title: "SubTotal",
                          price: 2590.00,
                        ),
                        CartSummery(
                          title: "Discount",
                          price: 0,
                        ),
                        CartSummery(
                          title: "Charges",
                          price: 250.00,
                        ),
                        CartSummery(
                          title: "Grnd Total",
                          price: 3250.00,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          : const EmptyCart(),
      bottomNavigationBar: GestureDetector(
        onTap: () => {},
        child: Container(
          height: size.height * 0.080,
          width: size.width / 2,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColors.primary,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: CustomLabel(
              label: "Place Order",
              textColor: AppColors.white,
              textAlign: TextAlign.center,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
