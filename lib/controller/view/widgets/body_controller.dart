import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/controller/view/widgets/body_controller_button.dart';

class BodyController extends StatefulWidget {
  const BodyController({super.key});

  @override
  State<BodyController> createState() => _BodyControllerState();
}

class _BodyControllerState extends State<BodyController> {
  double transOpacity = 1;
  double rotOpacity = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.horizontalPadding,
            vertical: AppPaddings.globalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppFont20(
              text: 'Kontrola ciałem',
              fontWeight: FontWeight.w600,
            ),
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
        ),
      ),
    );
  }
}
