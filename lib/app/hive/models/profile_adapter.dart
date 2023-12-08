import 'package:hive/hive.dart';
import 'package:robot_controller/app/hive/models/profile_model.dart';

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final int typeId = 1;

  @override
  ProfileModel read(BinaryReader reader) {
    final name = reader.readString();
    final surname = reader.readString();
    final job = reader.readString();

    return ProfileModel(
      name: name,
      surname: surname,
      job: job,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.surname ?? '');
    writer.writeString(obj.job ?? '');
  }
}
