import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/router/router.dart';
import 'package:robot_controller/app/src/enums/enums.dart';
import 'package:robot_controller/home/cubit/home_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(routes: routes, initialLocation: '/home');

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..fetchLocation(),
        ),
      ],
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          switch (state.appTabState) {
            case AppTabState.home:
              goRouter.go('/home');
            case AppTabState.controller:
              goRouter.go('/controller');
            case AppTabState.profile:
              goRouter.go('/profile');
            default:
              goRouter.go('/home');
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: goRouter,
        ),
      ),
    );
  }
}
