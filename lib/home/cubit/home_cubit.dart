import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:robot_controller/app/hive/models/coordinates_model.dart';
import 'package:robot_controller/app/services/permission.dart';
import 'package:robot_controller/app/src/enums/enums.dart';
import 'package:robot_controller/home/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeRepository _homeRepository = HomeRepository();

  void fetchLocation() async {
    emit(HomeLoading());
    try {
      final location = await PermissionsService().determinePosition();
      final placermark =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      final coordinatesBox =
          await Hive.openBox<CoordinatedModel>('coordinates');
      coordinatesBox.put(
        'location',
        CoordinatedModel(
          latitude: location.latitude,
          longitude: location.longitude,
          city: placermark.first.subLocality.toString(),
        ),
      );

      emit(
        HomeSuccess(
          location: placermark.first,
          longitude: location.longitude,
          latitude: location.latitude,
          status: Status.success,
        ),
      );
    } catch (e) {
      emit(
        HomeFailed(
          message: e.toString(),
          status: Status.failed,
        ),
      );
    }
  }

  Future<void> isRobotWorking() async {
    if (state is HomeSuccess) {
      final currentState = state as HomeSuccess;
      try {
        final body = await _homeRepository.isRobotWorking();
        emit(
          currentState.copyWith(isWorking: body),
        );
      } catch (e) {
        emit(
          HomeFailed(message: e.toString(), status: Status.failed),
        );
      }
    }
  }
}
