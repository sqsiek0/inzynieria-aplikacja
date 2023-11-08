import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/colors.dart';

class AppTile extends StatelessWidget {
  const AppTile(
      {super.key,
      required this.child,
      this.isExpanded = true,
      this.normalRadius = true,
      this.color,
      this.radius = 32,
      this.padding = 20});

  final Widget child;
  final bool isExpanded;
  final double padding;
  final bool normalRadius;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.infinity : null,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.blueWithOpacity,
              blurRadius: 4,
              offset: const Offset(0, -0.50),
            )
          ],
          borderRadius: normalRadius
              ? BorderRadius.circular(radius)
              : BorderRadius.only(
                  bottomLeft: Radius.circular(radius),
                  bottomRight: Radius.circular(radius))),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}
