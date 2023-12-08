import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.horizontalPadding,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.lightBlue),
          child: Center(
            child: AppFont20(
              text: text,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
