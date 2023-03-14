import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class CustomLabel extends StatefulWidget {
  final String label;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color textColor;
  final String? fontFamily;
  final double? height;
  final TextAlign? textAlign;

  const CustomLabel({
    super.key,
    required this.label,
    required this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.height,
    this.textAlign,
  });

  @override
  State<CustomLabel> createState() => _CustomLabelState();
}

class _CustomLabelState extends State<CustomLabel> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      textAlign: widget.textAlign ?? TextAlign.center,
      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.fontSize,
        fontFamily: widget.fontFamily ?? 'Poppins-Medium',
        fontWeight: widget.fontWeight,
        height: widget.height,
      ),
    );
  }
}
