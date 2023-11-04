import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/view/widgets/app_bottom_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: Text('home')),
      bottomNavigationBar: AppBottomBar(
        appTabState: context.watch<AppBloc>().state.appTabState,
      ),
    );
  }
}
