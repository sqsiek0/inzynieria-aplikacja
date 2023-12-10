import 'package:flutter/material.dart';

class AppFont20 extends StatelessWidget {
  const AppFont20({
    super.key,
    required this.text,
    this.fontWeight,
    this.isCentered = false,
    this.color,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      style: TextStyle(
          fontSize: 20,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Colors.black,
          fontFamily: 'Majorant'),
    );
  }
}
