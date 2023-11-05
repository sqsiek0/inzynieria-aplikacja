import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.isBack = false,
    required this.opacity,
    this.onReturn,
  });
  final String title;
  final bool isBack;
  final double opacity;
  final void Function()? onReturn;

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      sliver: SliverAppBar(
          title: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          // forceElevated: true,
          floating: true,
          elevation: 0.2,
          backgroundColor: Colors.white,
          collapsedHeight: 60,
          leading: isBack
              ? InkWell(
                  onTap: onReturn,
                  child: const Icon(
                    Icons.backpack,
                    color: Colors.black,
                  ),
                )
              : null),
    );
  }
}
