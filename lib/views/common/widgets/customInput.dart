import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final Color? focusedBorderColor;

  const CustomInput({super.key, this.hintText, this.focusedBorderColor});

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      textAlign: TextAlign.start,
      style: const TextStyle(
        height: 1.5,
        fontFamily: 'Poppins-Regular',
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.focusedBorderColor ?? AppColors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: const TextStyle(
          fontFamily: 'Poppins-Regular',
        ),
      ),
    );
  }
}
