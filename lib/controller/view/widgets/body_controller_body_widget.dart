import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/src/enums/enums.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/controller/cubit/controller_cubit.dart';
import 'package:robot_controller/controller/view/widgets/body_controller_button.dart';

class BodyControllerBodyWidget extends StatefulWidget {
  const BodyControllerBodyWidget({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<BodyControllerBodyWidget> createState() =>
      _BodyControllerBodyWidgetState();
}

class _BodyControllerBodyWidgetState extends State<BodyControllerBodyWidget> {
  bool bodyValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppFont20(
              text: 'Kontrola ciałem',
              fontWeight: FontWeight.w600,
            ),
            Switch(
              value: bodyValue,
              activeColor: AppColor.green,
              activeTrackColor: AppColor.green.withOpacity(0.3),
              onChanged: (value) {
                setState(
                  () {
                    bodyValue = value;
                  },
                );
              },
            )
          ],
        ),
        if (bodyValue == true)
          const Padding(
            padding: EdgeInsets.only(top: AppPaddings.globalPadding),
            child: Align(
              alignment: Alignment.center,
              child: AppFont16(
                text: 'Translacja',
                isBigMajorant: true,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        if (bodyValue == true)
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.globalPadding),
            child: AnimatedOpacity(
              opacity: widget.isLoading ? 0.5 : 1,
              duration: const Duration(milliseconds: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onPlusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.x.name, 'plus');
                          },
                          onMinusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.x.name, 'minus');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppFont16(
                          text: 'X',
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onPlusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.y.name, 'plus');
                          },
                          onMinusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.y.name, 'minus');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppFont16(text: 'Y')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onPlusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.z.name, 'plus');
                          },
                          onMinusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.z.name, 'minus');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppFont16(text: 'Z')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (bodyValue == true)
          const Padding(
            padding: EdgeInsets.only(top: AppPaddings.globalPadding),
            child: Align(
              alignment: Alignment.center,
              child: AppFont16(
                text: 'Rotacja',
                isBigMajorant: true,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        if (bodyValue == true)
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.globalPadding),
            child: AnimatedOpacity(
              opacity: widget.isLoading ? 0.5 : 1,
              duration: const Duration(milliseconds: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onPlusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.x.name, 'plus');
                          },
                          onMinusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.x.name, 'minus');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppFont16(text: 'X')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onPlusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.y.name, 'plus');
                          },
                          onMinusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.y.name, 'minus');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppFont16(text: 'Y')
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onPlusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.z.name, 'plus');
                          },
                          onMinusTap: () {
                            context
                                .read<ControllerCubit>()
                                .translateBody(ButtonAxis.z.name, 'minus');
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppFont16(text: 'Z')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ],
    );
  }
}
