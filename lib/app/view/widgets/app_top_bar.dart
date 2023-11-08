import 'package:flutter/material.dart';
import 'package:robot_controller/app/view/widgets/app_font_24.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.isBack = false,
    required this.opacity,
    required this.globalKey,
    this.onReturn,
  });
  final String title;
  final bool isBack;
  final double opacity;
  final void Function()? onReturn;
  final GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedOpacity(
      opacity: opacity,
      duration: const Duration(milliseconds: 500),
      sliver: SliverAppBar(
          title: AppFont24(text: title),
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
              : InkWell(
                  onTap: () {
                    globalKey.currentState?.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                )),
    );
  }
}
