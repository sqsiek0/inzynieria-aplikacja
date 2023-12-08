import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/router/router.dart';
import 'package:robot_controller/app/src/enums/enums.dart';
import 'package:robot_controller/home/cubit/home_cubit.dart';
import 'package:robot_controller/profile/cubit/profile_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // final goRouter = GoRouter(routes: routes, initialLocation: '/home');

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..fetchLocation(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..fetchData(),
        ),
      ],
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          switch (state.appTabState) {
            case AppTabState.home:
              AppRouter().router.go('/');
              break;
            case AppTabState.controller:
              AppRouter().router.go('/controller');
              break;
            case AppTabState.profile:
              AppRouter().router.go('/profile');
              break;
            default:
              break;
            //   newLocation = 'home';
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter().router,
        ),
      ),
    );
  }
}
