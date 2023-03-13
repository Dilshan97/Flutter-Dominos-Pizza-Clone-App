import 'package:flutter/cupertino.dart';

class CustomLabel extends StatefulWidget {
  final String label;
  final double? fontSize;
  final Color textColor;

  const CustomLabel({
    super.key,
    required this.label,
    required this.textColor,
    this.fontSize,
  });

  @override
  State<CustomLabel> createState() => _CustomLabelState();
}

class _CustomLabelState extends State<CustomLabel> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.fontSize,
        fontFamily: 'Poppins-Medium',
      ),
    );
  }
}
