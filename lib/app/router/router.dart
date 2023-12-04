import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:robot_controller/controller/view/controller.dart';
import 'package:robot_controller/home/view/home.dart';
import 'package:robot_controller/trying/profile.dart';

final GlobalKey<ScaffoldState> key = GlobalKey();
final GlobalKey<ScaffoldState> keyController = GlobalKey();

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
            child: Home(
          globalKey: key,
        )),
      ),
      GoRoute(
        path: '/controller',
        pageBuilder: (context, state) => MaterialPage(
            child: Controller(
          globalKey: keyController,
        )),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => const MaterialPage(child: Profile()),
      )
    ],
  );

  GoRouter get router => _router;
}
