import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;

  const CustomInput({
    super.key,
    this.hintText,
  });

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
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 255, 181, 33),
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
