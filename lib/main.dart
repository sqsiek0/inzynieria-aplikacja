import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:robot_controller/app/hive/models/coordinates_adapter.dart';
import 'package:robot_controller/app/hive/models/coordinates_model.dart';
import 'package:robot_controller/app/hive/models/profile_adapter.dart';
import 'package:robot_controller/app/hive/models/profile_model.dart';
import 'package:robot_controller/app/view/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CoordinatedModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());
  await Hive.openBox<CoordinatedModel>(
    'coordinates',
  );
  await Hive.openBox<ProfileModel>(
    'profile',
  );
  runApp(const App());
}
