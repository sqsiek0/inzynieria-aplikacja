import 'package:flutter/material.dart';

class AppFont32 extends StatelessWidget {
  const AppFont32({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: 'Majorant',
      ),
    );
  }
}
