import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/src/enums/enums.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/controller/cubit/controller_cubit.dart';

class BodyControllerWalkWidget extends StatefulWidget {
  const BodyControllerWalkWidget({super.key});

  @override
  State<BodyControllerWalkWidget> createState() =>
      _BodyControllerWalkWidgetState();
}

class _BodyControllerWalkWidgetState extends State<BodyControllerWalkWidget> {
  bool walkValue = true;
  ButtonDirection buttonDirection = ButtonDirection.stop;
  ButtonDirection oldButtonDirection = ButtonDirection.stop;

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
        ),
        const SizedBox(
          height: AppPaddings.globalPadding,
        ),
        if (walkValue)
          SizedBox(
            width: 300,
            height: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(
                      () {
                        buttonDirection = ButtonDirection.left;
                      },
                    );
                    context
                        .read<ControllerCubit>()
                        .turning(buttonDirection.name);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: buttonDirection == ButtonDirection.left
                          ? AppColor.lightBlue
                          : Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      size: 35,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        setState(() {
                          buttonDirection = ButtonDirection.front;
                        });
                        context
                            .read<ControllerCubit>()
                            .walk(buttonDirection.name);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: buttonDirection == ButtonDirection.front
                              ? AppColor.lightBlue
                              : Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.keyboard_arrow_up_rounded,
                            size: 35),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        setState(() {
                          buttonDirection = ButtonDirection.stop;
                        });
                        context
                            .read<ControllerCubit>()
                            .walk(buttonDirection.name);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: buttonDirection == ButtonDirection.stop
                              ? AppColor.lightBlue
                              : Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Image.asset(
                            'assets/hand.png',
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        setState(() {
                          buttonDirection = ButtonDirection.back;
                        });
                        context
                            .read<ControllerCubit>()
                            .walk(buttonDirection.name);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: buttonDirection == ButtonDirection.back
                              ? AppColor.lightBlue
                              : Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 35,
                        ),
                      ),
                    )
                  ],
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      buttonDirection = ButtonDirection.right;
                    });
                    context
                        .read<ControllerCubit>()
                        .turning(buttonDirection.name);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: buttonDirection == ButtonDirection.right
                          ? AppColor.lightBlue
                          : Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Icon(Icons.keyboard_arrow_right_rounded,
                        size: 35),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
}
