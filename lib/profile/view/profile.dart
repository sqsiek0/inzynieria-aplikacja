import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/services/state_indicator.dart';
import 'package:robot_controller/app/src/enums/enums.dart';
import 'package:robot_controller/app/view/widgets/app_bottom_bar.dart';
import 'package:robot_controller/app/view/widgets/app_drawer.dart';
import 'package:robot_controller/app/view/widgets/app_top_bar.dart';
import 'package:robot_controller/profile/cubit/profile_cubit.dart';
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
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Stack(
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
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        if (state.status == Status.loading ||
                            state.status == Status.initial)
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (state.status == Status.failed)
                          StateIndicator(
                            stateIndicatorState: StateIndicatorState.failed,
                            onTap: () =>
                                context.read<ProfileCubit>().fetchData(),
                          ),
                        if (state.status == Status.success)
                          PersonalInfo(
                            name: state.name,
                            surname: state.surname,
                            job: state.job,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
