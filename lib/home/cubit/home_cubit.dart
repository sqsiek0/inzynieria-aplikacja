import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:robot_controller/app/services/permission.dart';
import 'package:robot_controller/app/src/enums/enums.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void fetchLocation() async {
    emit(HomeLoading());
    try {
      final location = await PermissionsService().determinePosition();
      final placermark =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      emit(HomeSuccess(
        location: placermark.first,
        status: Status.success,
      ));
    } catch (e) {
      emit(HomeFailed(
        message: e.toString(),
        status: Status.failed,
      ));
    }
  }
}
