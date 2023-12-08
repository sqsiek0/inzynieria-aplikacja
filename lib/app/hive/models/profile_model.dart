// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ProfileModel extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? surname;

  @HiveField(2)
  String? job;

  ProfileModel({
    this.name = 'Brak imienia',
    this.surname,
    this.job,
  });
}
