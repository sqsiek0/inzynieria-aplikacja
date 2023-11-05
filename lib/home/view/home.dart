import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_bottom_bar.dart';
import 'package:robot_controller/app/view/widgets/app_top_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController scrollController;
  double opacity = 1;

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (scrollController.offset > 0) {
            opacity = 0.5;
          } else {
            opacity = 1;
          }
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              AppTopBar(
                title: 'Home',
                opacity: opacity,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: AppPaddings.horizontalPadding),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.blueWithOpacity,
                            blurRadius: 4,
                            offset: const Offset(0, -0.50),
                          )
                        ],
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32),
                            bottomRight: Radius.circular(32))),
                  ),
                ),
              ),
              for (var i = 0; i < 10; i++)
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    color: Colors.amber,
                  ),
                )
            ],
          ),
          Positioned(
            child: AppBottomBar(
              appTabState: context.watch<AppBloc>().state.appTabState,
            ),
          )
        ],
      ),
      // bottomNavigationBar: AppBottomBar(
      //   appTabState: context.watch<AppBloc>().state.appTabState,
      // ),
    );
  }
}
