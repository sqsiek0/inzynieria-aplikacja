import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';

class BodyControllerButton extends StatelessWidget {
  const BodyControllerButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, -1.5),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              onTap: onTap,
              child: const Padding(
                padding:
                    EdgeInsets.only(bottom: AppPaddings.globalPadding * 0.75),
                child: Icon(Icons.add),
              ),
            ),
            InkWell(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(top: AppPaddings.globalPadding * 0.75),
                child: Icon(Icons.remove),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
