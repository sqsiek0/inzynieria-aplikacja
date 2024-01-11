import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/app/view/widgets/app_font_24.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var technologies = [
      'Flutter',
      'Python',
      'Fusion 360',
      'ROS2',
      'Git',
      'Docker',
      'Flask',
      'Flask_mqtt'
    ];

    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPaddings.horizontalPadding),
            child: Column(
              children: [
                const AppFont24(text: 'Uzyte komponenty:'),
                const SizedBox(
                  height: AppPaddings.globalPadding,
                ),
                Image.asset(
                  'assets/silnik.HEIC',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppFont16(
                  text: 'Silniki Dynamixel XM430-W350-R',
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
                const SizedBox(
                  height: AppPaddings.globalPadding,
                ),
                Image.asset(
                  'assets/rasberry.HEIC',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppFont16(
                  text: 'Rasberry Pi 4B',
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
                const SizedBox(
                  height: AppPaddings.globalPadding,
                ),
                Image.asset(
                  'assets/plytka.HEIC',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 5,
                ),
                AppFont16(
                  text: 'Autorska płytka sterująca',
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.5),
                ),
                const SizedBox(
                  height: AppPaddings.globalPadding,
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: AppPaddings.globalPadding),
                  child: AppFont24(text: 'Uzyte technologie:'),
                ),
                for (var i = 0; i < technologies.length; i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPaddings.globalPadding / 2),
                        child: AppFont20(
                          text: technologies[i],
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      i != technologies.length - 1
                          ? Divider(
                              color: Colors.black.withOpacity(0.1),
                            )
                          : Container()
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
