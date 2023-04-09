import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class FrequentItem extends StatefulWidget {
  const FrequentItem({super.key});

  @override
  State<FrequentItem> createState() => _FrequentItemState();
}

class _FrequentItemState extends State<FrequentItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  "https://images.dominos.co.in/srilanka/toppingsTomato.jpg",
                  width: 70,
                  fit: BoxFit.contain,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomLabel(
                        label: "Pepsi 500Ml",
                        textColor: AppColors.black,
                      ),
                      CustomLabel(
                        label: "Rs. 250",
                        textColor: AppColors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                child: const CustomLabel(
                  label: "Add",
                  textColor: AppColors.tertiary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
