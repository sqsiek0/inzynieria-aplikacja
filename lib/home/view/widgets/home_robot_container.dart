import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/app/view/widgets/app_tile.dart';

class HomeRobotContainer extends StatelessWidget {
  const HomeRobotContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: AppPaddings.horizontalPadding),
        child: AppTile(
          normalRadius: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppFont20(text: 'Hexapod'),
                  AppTile(
                    isExpanded: false,
                    color: AppColor.green,
                    padding: 10,
                    child: const AppFont20(
                      text: 'Połączony',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppPaddings.globalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.amber.shade100),
                      ),
                    ),
                    const SizedBox(
                      width: AppPaddings.globalPadding,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppTile(
                              isExpanded: false,
                              padding: 10,
                              radius: 16,
                              child: Row(
                                children: [
                                  const Icon(Icons.battery_5_bar_rounded),
                                  const SizedBox(
                                    width: AppPaddings.globalPadding / 2,
                                  ),
                                  AppFont20(
                                    text: '24%',
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: AppPaddings.globalPadding / 2,
                          ),
                          AppTile(
                              isExpanded: false,
                              padding: 10,
                              radius: 16,
                              child: Row(
                                children: [
                                  const Icon(Icons.timelapse_outlined),
                                  const SizedBox(
                                    width: AppPaddings.globalPadding / 2,
                                  ),
                                  AppFont20(
                                    text: '3 h',
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
