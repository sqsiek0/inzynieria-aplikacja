import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/controller/view/widgets/body_controller_body_widget.dart';
import 'package:robot_controller/controller/view/widgets/body_controller_walk_widget.dart';

class BodyController extends StatefulWidget {
  const BodyController({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<BodyController> createState() => _BodyControllerState();
}

class _BodyControllerState extends State<BodyController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPaddings.horizontalPadding,
            vertical: AppPaddings.globalPadding),
        child: Column(
          children: [
            BodyControllerBodyWidget(
              isLoading: widget.isLoading,
            ),
            const SizedBox(
              height: AppPaddings.globalPadding,
            ),
            const BodyControllerWalkWidget()
          ],
        ),
      ),
    );
  }
}
