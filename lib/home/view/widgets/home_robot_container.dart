import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/app/view/widgets/app_tile.dart';
import 'package:robot_controller/controller/cubit/controller_cubit.dart';
import 'package:robot_controller/home/cubit/home_cubit.dart';

class HomeRobotContainer extends StatelessWidget {
  const HomeRobotContainer({super.key, required this.isWorking});
  final bool isWorking;

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
                const AppFont20(
                  text: 'Hexapod',
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: () async {
                    await context.read<HomeCubit>().isRobotWorking().then(
                          (value) => context
                              .read<ControllerCubit>()
                              .changeVisibility(),
                        );
                  },
                  child: AppTile(
                    isExpanded: false,
                    color: isWorking ? AppColor.green : AppColor.red,
                    padding: 10,
                    radius: 16,
                    child: Row(
                      children: [
                        Icon(
                          isWorking ? Icons.link : Icons.link_off,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: AppPaddings.globalPadding / 2,
                        ),
                        AppFont16(
                          text: isWorking ? 'Połączony' : 'Rozłączony',
                          color: Colors.white,
                          isBigMajorant: true,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPaddings.globalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 2,
                      child: Image.asset(
                        'assets/hexapod_small.png',
                        width: 200,
                        height: 200,
                      )),
                  const SizedBox(
                    width: AppPaddings.globalPadding,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // AppTile(
                        //     isExpanded: false,
                        //     padding: 10,
                        //     radius: 16,
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         const AppFont16(
                        //           text: 'Bateria',
                        //         ),
                        //         const SizedBox(
                        //           height: 5,
                        //         ),
                        //         Row(
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Image.asset('assets/batery.png',
                        //                 width: 20, height: 20),
                        //             const SizedBox(
                        //               width: AppPaddings.globalPadding / 2,
                        //             ),
                        //             AppFont16(
                        //               text: '24%',
                        //               color: Colors.black.withOpacity(0.5),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     )),
                        // const SizedBox(
                        //   height: AppPaddings.globalPadding / 2,
                        // ),
                        // AppTile(
                        //   isExpanded: false,
                        //   padding: 10,
                        //   radius: 16,
                        //   child: Column(
                        //     children: [
                        //       const AppFont16(
                        //         text: 'Czas pracy',
                        //       ),
                        //       const SizedBox(
                        //         height: 5,
                        //       ),
                        //       Row(
                        //         children: [
                        //           Image.asset('assets/clock.png',
                        //               width: 20, height: 20),
                        //           const SizedBox(
                        //             width: AppPaddings.globalPadding / 2,
                        //           ),
                        //           AppFont16(
                        //             text: '3 h',
                        //             color: Colors.black.withOpacity(0.5),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
