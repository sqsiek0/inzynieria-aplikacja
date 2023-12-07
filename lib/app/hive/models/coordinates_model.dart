// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class CoordinatedModel extends HiveObject {
  @HiveField(0)
  double latitude;

  @HiveField(1)
  double longitude;

  @HiveField(2)
  String city;

  CoordinatedModel({
    required this.latitude,
    required this.longitude,
    required this.city,
  });
}
