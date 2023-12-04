import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:robot_controller/controller/view/controller.dart';
import 'package:robot_controller/home/view/home.dart';
import 'package:robot_controller/trying/cart.dart';
import 'package:robot_controller/trying/profile.dart';

final GlobalKey<ScaffoldState> key = GlobalKey();

final routes = [
  GoRoute(
    path: '/home',
    pageBuilder: (context, state) => MaterialPage(
        child: Home(
      globalKey: key,
    )),
  ),
  GoRoute(
    path: '/controller',
    pageBuilder: (context, state) => MaterialPage(
        child: Controller(
      globalKey: key,
    )),
  ),
  GoRoute(
    path: '/profile',
    pageBuilder: (context, state) => const MaterialPage(child: Profile()),
  )
];
