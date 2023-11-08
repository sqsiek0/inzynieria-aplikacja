import 'package:flutter/material.dart';

class AppFont16 extends StatelessWidget {
  const AppFont16({
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
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }
}
