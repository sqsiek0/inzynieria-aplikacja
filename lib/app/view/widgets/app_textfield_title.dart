import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';

class AppTextFieldTtile extends StatelessWidget {
  const AppTextFieldTtile({
    super.key,
    required this.title,
    required this.controller,
    required this.isEnd,
  });
  final String title;
  final TextEditingController controller;
  final bool isEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPaddings.horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFont16(
            text: title,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: controller,
            textInputAction:
                isEnd ? TextInputAction.done : TextInputAction.next,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.lightBlue.withOpacity(0.1),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppPaddings.horizontalPadding,
                vertical: 15,
              ),
              isDense: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: AppPaddings.globalPadding,
          ),
        ],
      ),
    );
  }
}
