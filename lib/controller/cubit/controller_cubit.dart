import 'package:bloc/bloc.dart';
import 'package:robot_controller/app/src/enums/enums.dart';
import 'package:robot_controller/controller/repository/controller_repository.dart';

part 'controller_state.dart';

class ControllerCubit extends Cubit<ControllerState> {
  ControllerCubit()
      : super(
          ControllerState(isWorking: false, status: Status.initial),
        );
  final ControllerRepository _controllerRepository = ControllerRepository();

  void changeVisibility() => emit(
        state.copyWith(isWorking: !state.isWorking),
      );

  Future<void> translateBody(
    String axis,
    String value,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await _controllerRepository.translateBody(axis, value);
      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(status: Status.failed));
    }
  }
}
