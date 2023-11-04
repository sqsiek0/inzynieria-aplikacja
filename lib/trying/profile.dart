import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/view/widgets/app_bottom_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AppBottomBar(
            appTabState: context.read<AppBloc>().state.appTabState),
        body: const SafeArea(child: Text('profile')));
  }
}
