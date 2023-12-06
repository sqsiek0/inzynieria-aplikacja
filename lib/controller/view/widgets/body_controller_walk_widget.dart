import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';

class BodyControllerWalkWidget extends StatefulWidget {
  const BodyControllerWalkWidget({super.key});

  @override
  State<BodyControllerWalkWidget> createState() =>
      _BodyControllerWalkWidgetState();
}

class _BodyControllerWalkWidgetState extends State<BodyControllerWalkWidget> {
  bool walkValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppFont20(
              text: 'Kontrola chodu',
              fontWeight: FontWeight.w600,
            ),
            Switch(
              value: walkValue,
              activeColor: AppColor.green,
              activeTrackColor: AppColor.green.withOpacity(0.3),
              onChanged: (value) {
                setState(
                  () {
                    walkValue = value;
                  },
                );
              },
            )
          ],
        )
      ],
    );
  }
}
