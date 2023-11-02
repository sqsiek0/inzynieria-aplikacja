import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/src/enums/enums.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
                onPressed: () => context
                    .read<AppBloc>()
                    .add(AppChangeTab(appTabState: AppTabState.cart)),
                child: const Text('Koszyk')),
            ElevatedButton(
                onPressed: () => context
                    .read<AppBloc>()
                    .add(AppChangeTab(appTabState: AppTabState.profile)),
                child: const Text('Profil'))
          ],
        ),
      ),
    );
  }
}
