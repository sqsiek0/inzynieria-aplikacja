import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    path: '/cart',
    pageBuilder: (context, state) => const MaterialPage(child: Cart()),
  ),
  GoRoute(
    path: '/profile',
    pageBuilder: (context, state) => const MaterialPage(child: Profile()),
  )
];
