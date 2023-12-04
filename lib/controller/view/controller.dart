import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/view/widgets/app_bottom_bar.dart';
import 'package:robot_controller/app/view/widgets/app_drawer.dart';
import 'package:robot_controller/app/view/widgets/app_top_bar.dart';
import 'package:robot_controller/controller/view/widgets/body_controller.dart';
import 'package:robot_controller/home/cubit/home_cubit.dart';

class Controller extends StatefulWidget {
  const Controller({super.key, required this.globalKey});
  final GlobalKey<ScaffoldState> globalKey;

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
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
  // void dispose() {
  //   scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
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
                    title: 'Kontroler',
                    opacity: opacity,
                    globalKey: widget.globalKey,
                  ),
                  const SliverToBoxAdapter(
                    child: BodyController(),
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
      },
    );
  }
}
