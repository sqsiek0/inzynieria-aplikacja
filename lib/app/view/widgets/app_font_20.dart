import 'package:flutter/material.dart';

class AppFont20 extends StatelessWidget {
  const AppFont20({
    super.key,
    required this.text,
    this.color,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      ),
    );
  }
}
