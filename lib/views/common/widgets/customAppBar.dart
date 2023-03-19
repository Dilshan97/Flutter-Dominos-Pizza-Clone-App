import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../home/home.dart';
import '../colors.dart';
import 'customLabel.dart';

class CustomAppBar extends StatefulWidget {
  final String name;
  const CustomAppBar({
    super.key,
    required this.name,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      title: CustomLabel(
        label: widget.name,
        textColor: AppColors.black,
        textAlign: TextAlign.center,
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
    );
  }
}
