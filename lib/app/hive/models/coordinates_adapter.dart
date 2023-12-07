import 'package:hive/hive.dart';
import 'package:robot_controller/app/hive/models/coordinates_model.dart';

class CoordinatedModelAdapter extends TypeAdapter<CoordinatedModel> {
  @override
  final int typeId = 0;

  @override
  CoordinatedModel read(BinaryReader reader) {
    final latitude = reader.readDouble();
    final longitude = reader.readDouble();
    final city = reader.readString();

    return CoordinatedModel(
      latitude: latitude,
      longitude: longitude,
      city: city,
    );
  }

  @override
  void write(BinaryWriter writer, CoordinatedModel obj) {
    writer.writeDouble(obj.latitude);
    writer.writeDouble(obj.longitude);
    writer.writeString(obj.city);
  }
}
