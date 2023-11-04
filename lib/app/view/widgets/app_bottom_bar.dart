import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/src/enums/enums.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key, required this.appTabState});
  final AppTabState appTabState;

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          const Divider(
            color: AppColor.greyColor,
            thickness: 0.1,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomBarIcon(
                  icon: Icons.home_outlined,
                  color: widget.appTabState == AppTabState.home
                      ? Colors.amber
                      : Colors.black,
                  onTap: () {
                    context
                        .read<AppBloc>()
                        .add(AppChangeTab(appTabState: AppTabState.home));
                  },
                ),
                BottomBarIcon(
                  icon: Icons.card_travel_outlined,
                  color: widget.appTabState == AppTabState.cart
                      ? Colors.amber
                      : Colors.black,
                  onTap: () {
                    context
                        .read<AppBloc>()
                        .add(AppChangeTab(appTabState: AppTabState.cart));
                  },
                ),
                BottomBarIcon(
                  icon: Icons.person_outline,
                  color: widget.appTabState == AppTabState.profile
                      ? Colors.amber
                      : Colors.black,
                  onTap: () {
                    context
                        .read<AppBloc>()
                        .add(AppChangeTab(appTabState: AppTabState.profile));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon({
    super.key,
    required this.icon,
    required this.color,
    this.onTap,
  });
  final IconData icon;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: IconButton(
          icon: Icon(
            icon,
          ),
          iconSize: 40,
          color: color,
          onPressed: onTap,
        ),
      ),
    );
  }
}
