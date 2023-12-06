import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/controller/view/widgets/body_controller_button.dart';

class BodyControllerBodyWidget extends StatefulWidget {
  const BodyControllerBodyWidget({super.key});

  @override
  State<BodyControllerBodyWidget> createState() =>
      _BodyControllerBodyWidgetState();
}

class _BodyControllerBodyWidgetState extends State<BodyControllerBodyWidget> {
  double transOpacity = 1;
  double rotOpacity = 1;
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
              opacity: transOpacity,
              onEnd: () {
                Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {
                    transOpacity = 1;
                  });
                });
              },
              duration: const Duration(milliseconds: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onTap: () {
                            setState(
                              () {
                                transOpacity = 0.5;
                              },
                            );
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
                  const Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(),
                        SizedBox(
                          height: 10,
                        ),
                        AppFont16(text: 'Y')
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(),
                        SizedBox(
                          height: 10,
                        ),
                        AppFont16(text: 'Z')
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
              onEnd: () {
                Future.delayed(
                  const Duration(milliseconds: 500),
                  () {
                    setState(() {
                      rotOpacity = 1;
                    });
                  },
                );
              },
              opacity: rotOpacity,
              duration: const Duration(milliseconds: 50),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(
                          onTap: () {
                            setState(
                              () {
                                rotOpacity = 0.5;
                              },
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppFont16(text: 'X')
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(),
                        SizedBox(
                          height: 10,
                        ),
                        AppFont16(text: 'Y')
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        BodyControllerButton(),
                        SizedBox(
                          height: 10,
                        ),
                        AppFont16(text: 'Z')
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
