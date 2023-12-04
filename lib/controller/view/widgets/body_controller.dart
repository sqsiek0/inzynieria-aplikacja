import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/controller/view/widgets/body_controller_button.dart';

class BodyController extends StatelessWidget {
  const BodyController({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppPaddings.horizontalPadding,
          vertical: AppPaddings.globalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppFont20(
            text: 'Kontrola ciałem',
            fontWeight: FontWeight.w600,
          ),
          Padding(
            padding: EdgeInsets.only(top: AppPaddings.globalPadding * 2),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [BodyControllerButton()],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [BodyControllerButton()],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [BodyControllerButton()],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
