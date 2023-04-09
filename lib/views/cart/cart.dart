import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';

import '../common/widgets/customLabel.dart';
import '../home/home.dart';
import 'widget/emptyCart.dart';

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
      body: SizedBox(
        width: size.width,
        child: SizedBox(
          height: size.height / 2,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (context, index) => Card(
              color: AppColors.white,
              elevation: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Dismissible(
                  key: Key(items[index]),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          "https://images.dominos.co.in/srilanka/toppingsTomato.jpg",
                          width: 70,
                          fit: BoxFit.contain,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CustomLabel(
                              label: "Tandoori Chicken",
                              textColor: AppColors.black,
                            ),
                            Text("Medium | Classic Hand Tossed"),
                            CustomLabel(
                              label: "Rs.2029.00",
                              textColor: AppColors.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
