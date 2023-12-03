import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_bottom_bar.dart';
import 'package:robot_controller/app/view/widgets/app_drawer.dart';
import 'package:robot_controller/app/view/widgets/app_font_20.dart';
import 'package:robot_controller/app/view/widgets/app_font_24.dart';
import 'package:robot_controller/app/view/widgets/app_top_bar.dart';
import 'package:robot_controller/home/view/widgets/home_gps_widget.dart';
import 'package:robot_controller/home/view/widgets/home_robot_container.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.globalKey});
  final GlobalKey<ScaffoldState> globalKey;

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
      key: widget.globalKey,
      drawer: const AppDrawer(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              AppTopBar(
                title: 'Główna',
                opacity: opacity,
                globalKey: widget.globalKey,
              ),
              const SliverToBoxAdapter(child: HomeRobotContainer()),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPaddings.globalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppFont20(text: 'Aktualna pozycja'),
                      SizedBox(
                        height: AppPaddings.globalPadding / 2,
                      ),
                      HomeGPSWidget()
                    ],
                  ),
                ),
              ),
              for (var i = 0; i < 10; i++)
                SliverToBoxAdapter(
                  child: Container(
                    height: 100,
                    color: Colors.transparent,
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
    );
  }
}
