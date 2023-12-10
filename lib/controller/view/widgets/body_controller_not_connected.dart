import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/app/view/widgets/app_font_32.dart';

class ControllerNotConnected extends StatelessWidget {
  const ControllerNotConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPaddings.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Icon(Icons.link_off, size: 60, color: Colors.black),
          SizedBox(
            height: 50,
          ),
          AppFont32(
            text: 'Nie jesteś połączony z robotem',
          ),
          SizedBox(
            height: 20,
          ),
          AppFont20(
            text: 'Aby móc kontrolować robota, musisz się z nim połączyć',
            isCentered: true,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
