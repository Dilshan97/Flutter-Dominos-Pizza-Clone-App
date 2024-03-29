import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/services/cart_service.dart';
import 'package:flutter_notes/views/common/colors.dart';
import 'package:flutter_notes/views/common/constants.dart';
import 'package:flutter_notes/views/common/widgets/customLabel.dart';
import 'package:flutter_svg/svg.dart';

import '../cart/cart.dart';
import '../home/home.dart';
import 'widget/crust.dart';
import 'widget/pizzaSize.dart';
import 'widget/toppingItem.dart';

class FoodItem extends StatefulWidget {
  final Map food;
  const FoodItem({
    super.key,
    required this.food,
  });

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  late int selectedSize = 0;
  late int selectedCrust = 0;

  late String pizzaSize = "Regular";
  late String pizzaCrust = "Thin";
  late int pizzaPrice = 0;
  late bool extraCheese = false;
  List selectedVegToppings = [];
  List selectedNonVegToppings = [];

  void resetToppings() {
    setState(() {
      selectedVegToppings = [];
      selectedNonVegToppings = [];
    });
  }

  Future<void> addToCart() async {
    print('addToCart');
    print(widget.food);
    print(pizzaSize);
    print(pizzaCrust);

    // CartService cartService = CartService(context);
    // cartService.addItemToCart(id, name, qty, type)
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: false,
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
            onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const Cart()),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.food['name'],
                  style: const TextStyle(
                    fontFamily: 'Poppins-Regular',
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                CustomLabel(
                  label: widget.food['desc'],
                  textColor: AppColors.black,
                  textAlign: TextAlign.start,
                  fontSize: 14,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                pizzaPrice != 0
                    ? Row(
                        children: [
                          const CustomLabel(
                            label: "Rs.",
                            textColor: AppColors.primary,
                            fontSize: 18,
                          ),
                          Text(
                            "$pizzaPrice",
                            style: const TextStyle(
                              fontSize: 40,
                              fontFamily: 'Poppins-Regular',
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                              height: 1,
                            ),
                          )
                        ],
                      )
                    : Text(""),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Size",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            pizzaSize,
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Delivery In",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "30 min",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Crust",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            pizzaCrust,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins-Regular',
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Hero(
                        tag: widget.food['image'],
                        child: Container(
                          transform: Matrix4.translationValues(
                            2.0,
                            25.0,
                            0.0,
                          ),
                          height: 200,
                          width: size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.lightGray,
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: Image.asset(
                            widget.food['image'],
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 50,
            ),
            child: Text(
              "Select Size",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          widget.food['type'] == "pizza"
              ? SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.food['sizes'].length,
                    itemBuilder: (context, index) => PizzaSize(
                      index: index,
                      selectedSize: selectedSize,
                      title: widget.food['sizes'][index]['name'],
                      subTitle: widget.food['sizes'][index]['desc'],
                      image: widget.food['sizes'][index]['image'],
                      onChanged: () => {
                        setState(() {
                          selectedSize = index;
                          selectedCrust = 0;
                          pizzaSize = widget.food['sizes'][index]['name'];
                        })
                      },
                    ),
                  ),
                )
              : Text(""),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              "Select Crust",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins-Regular',
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          widget.food['type'] == "pizza"
              ? SizedBox(
                  height: 75,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        widget.food['sizes'][selectedSize]['crust'].length,
                    itemBuilder: (context, index) => Crust(
                      index: index,
                      selectedCrust: selectedCrust,
                      crustName: widget.food['sizes'][selectedSize]['crust']
                          [index]['name'],
                      onChanged: () => {
                        setState(() {
                          selectedCrust = index;
                          pizzaCrust = widget.food['sizes'][selectedSize]
                              ['crust'][index]['name'];
                          pizzaPrice = widget.food['sizes'][selectedSize]
                              ['crust'][index]['price'];
                        })
                      },
                    ),
                  ),
                )
              : Text(""),
          const SizedBox(
            height: 10,
          ),
          widget.food['type'] == "pizza"
              ? SizedBox(
                  height: 75,
                  child: CheckboxListTile(
                    value: extraCheese,
                    title: const CustomLabel(
                      label: "Add extra cheese @ Rs.160.00",
                      textColor: AppColors.black,
                      textAlign: TextAlign.start,
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (value) => {
                      setState(() => {extraCheese = value!})
                    },
                    checkColor: AppColors.white,
                    activeColor: AppColors.primary,
                  ),
                )
              : Text(""),
          widget.food['type'] == "pizza"
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 5,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Toppings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins-Regular',
                        ),
                      ),
                      GestureDetector(
                        onTap: resetToppings,
                        child: const Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Text(""),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 30,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: CustomLabel(
                label: "Add Veg Toppings @ Rs.125.00 each",
                textColor: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          widget.food['type'] == "pizza"
              ? SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: vegToppings.length,
                    itemBuilder: (context, index) => ToppingItem(
                      index: index,
                      name: vegToppings[index]['name'],
                      image: vegToppings[index]['image'],
                      isSelected:
                          selectedVegToppings.contains(vegToppings[index]['id'])
                              ? true
                              : false,
                      onChanged: () {
                        setState(() {
                          if (selectedVegToppings
                              .contains(vegToppings[index]['id'])) {
                            selectedVegToppings
                                .remove(vegToppings[index]['id']);
                          } else {
                            selectedVegToppings.add(vegToppings[index]['id']);
                          }
                        });
                      },
                    ),
                  ),
                )
              : Text(""),
          const SizedBox(
            height: 30,
            child: Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: CustomLabel(
                label: "Add Non-Veg Toppings @ Rs.190.00 each",
                textColor: AppColors.black,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          widget.food['type'] == "pizza"
              ? SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: nonVegToppings.length,
                    itemBuilder: (context, index) => ToppingItem(
                      index: index,
                      name: nonVegToppings[index]['name'],
                      image: nonVegToppings[index]['image'],
                      isSelected: selectedNonVegToppings
                              .contains(nonVegToppings[index]['id'])
                          ? true
                          : false,
                      onChanged: () {
                        setState(() {
                          if (selectedNonVegToppings
                              .contains(nonVegToppings[index]['id'])) {
                            selectedNonVegToppings
                                .remove(nonVegToppings[index]['id']);
                          } else {
                            selectedNonVegToppings
                                .add(nonVegToppings[index]['id']);
                          }
                        });
                      },
                    ),
                  ),
                )
              : Text(""),
          GestureDetector(
            onTap: addToCart,
            child: Container(
              height: size.height * 0.070,
              width: size.width * 0.30,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: CustomLabel(
                  label: "Add to order",
                  textColor: AppColors.white,
                  textAlign: TextAlign.center,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.10,
          )
        ],
      ),
    );
  }
}
