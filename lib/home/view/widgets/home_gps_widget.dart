import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_tile.dart';

class HomeGPSWidget extends StatelessWidget {
  const HomeGPSWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTile(
        child: Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.amber.shade100,
        ),
        const SizedBox(
          height: AppPaddings.globalPadding / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppTile(
                isExpanded: false,
                radius: 16,
                padding: 10,
                child: Icon(Icons.location_on_outlined)),
            const SizedBox(
              width: AppPaddings.globalPadding / 2,
            ),
            Row(
              children: [
                AppFont16(
                  text: 'Miasto, (51,24 W, 51.24 N)',
                  color: Colors.black.withOpacity(0.6),
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
