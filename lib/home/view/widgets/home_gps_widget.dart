import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:robot_controller/app/hive/models/coordinates_model.dart';
import 'package:robot_controller/app/src/constants/colors.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_tile.dart';

class HomeGPSWidget extends StatelessWidget {
  const HomeGPSWidget(
      {super.key,
      required this.location,
      required this.longitude,
      required this.latitude});
  final Placemark location;
  final double longitude;
  final double latitude;

  @override
  Widget build(BuildContext context) {
    final coordinates =
        Hive.box<CoordinatedModel>('coordinates').get('location');

    return AppTile(
        child: Column(
      children: [
        SizedBox(
          height: 200,
          child: FlutterMap(
            options: MapOptions(initialCenter: LatLng(latitude, longitude)),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(latitude, longitude),
                    width: 40,
                    height: 40,
                    child: Icon(
                      Icons.location_on,
                      size: 40,
                      color: AppColor.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppPaddings.globalPadding / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AppTile(
                isExpanded: false,
                radius: 16,
                padding: 10,
                child: Icon(Icons.location_on_outlined)),
            const SizedBox(
              width: AppPaddings.globalPadding / 2,
            ),
            Row(
              children: [
                AppFont16(
                  text:
                      '${coordinates?.city ?? 'Brak'}, (${coordinates?.latitude ?? 0} ${(coordinates?.latitude ?? 0) > 0 ? 'N' : 'S'}, ${coordinates?.longitude ?? 0} ${(coordinates?.longitude ?? 0) > 0 ? 'E' : 'W'})',
                  color: Colors.black.withOpacity(0.6),
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
