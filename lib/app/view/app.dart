import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:robot_controller/app/bloc/app_bloc.dart';
import 'package:robot_controller/app/router/router.dart';
import 'package:robot_controller/app/src/enums/enums.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter(routes: routes, initialLocation: '/home');

    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          switch (state.appTabState) {
            case AppTabState.home:
              goRouter.go('/home');
            case AppTabState.cart:
              goRouter.go('/cart');
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
