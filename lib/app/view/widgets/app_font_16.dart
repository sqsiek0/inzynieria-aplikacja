import 'package:flutter/material.dart';

class AppFont16 extends StatelessWidget {
  const AppFont16({
    super.key,
    required this.text,
    this.fontWeight,
    this.fontSize,
    this.color,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
          fontFamily: 'Majorant_small',
        ));
  }
}
