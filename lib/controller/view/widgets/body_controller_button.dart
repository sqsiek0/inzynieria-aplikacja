import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';

class BodyControllerButton extends StatelessWidget {
  const BodyControllerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  print('+');
                },
                child: const Icon(Icons.add)),
            const SizedBox(
              height: AppPaddings.globalPadding,
            ),
            InkWell(onTap: () {}, child: const Icon(Icons.remove)),
          ],
        ),
      ),
    );
  }
}
