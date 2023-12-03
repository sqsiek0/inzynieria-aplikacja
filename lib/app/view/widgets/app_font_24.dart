import 'package:flutter/material.dart';

class AppFont24 extends StatelessWidget {
  const AppFont24({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: 'Majorant'),
    );
  }
}
