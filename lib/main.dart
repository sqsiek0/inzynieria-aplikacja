import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:robot_controller/app/hive/models/coordinates_adapter.dart';
import 'package:robot_controller/app/hive/models/coordinates_model.dart';
import 'package:robot_controller/app/view/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CoordinatedModelAdapter());
  await Hive.openBox<CoordinatedModel>(
    'coordinates',
  );
  runApp(const App());
}
