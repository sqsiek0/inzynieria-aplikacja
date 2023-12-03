import 'package:flutter/material.dart';

class AppFont20 extends StatelessWidget {
  const AppFont20({
    super.key,
    required this.text,
    this.fontWeight,
    this.color,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
          fontFamily: 'Majorant'),
    );
  }
}
