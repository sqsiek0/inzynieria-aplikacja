import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/view/widgets/app_bottom_bar.dart';
import 'package:robot_controller/app/view/widgets/app_drawer.dart';
import 'package:robot_controller/app/view/widgets/app_top_bar.dart';
import 'package:robot_controller/profile/view/widgets/personal_info.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.globalKey});
  final GlobalKey<ScaffoldState> globalKey;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: widget.globalKey,
      drawer: const AppDrawer(),
      bottomNavigationBar: AppBottomBar(
        appTabState: context.watch<AppBloc>().state.appTabState,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              AppTopBar(
                title: 'Profil',
                opacity: opacity,
                globalKey: widget.globalKey,
              ),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    PersonalInfo(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
