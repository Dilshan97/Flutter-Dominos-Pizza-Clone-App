import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/views/common/colors.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final Color? focusedBorderColor;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const CustomInput({
    super.key,
    this.hintText,
    this.focusedBorderColor,
    required this.controller,
    this.obscureText,
    this.suffixIcon,
    this.validator,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
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
        suffixIcon: widget.suffixIcon,
      ),
      validator: widget.validator,
    );
  }
}
