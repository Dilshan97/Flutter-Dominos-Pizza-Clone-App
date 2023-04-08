import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../common/colors.dart';
import '../../common/widgets/customLabel.dart';

class ToppingItem extends StatefulWidget {
  final String image;
  final String name;
  const ToppingItem({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  State<ToppingItem> createState() => _ToppingItemState();
}

class _ToppingItemState extends State<ToppingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            widget.image,
            fit: BoxFit.cover,
            width: 100,
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
    );
  }
}
