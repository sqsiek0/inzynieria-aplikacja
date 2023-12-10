import 'package:bloc/bloc.dart';
import 'package:robot_controller/app/src/enums/enums.dart';

part 'controller_state.dart';

class ControllerCubit extends Cubit<ControllerState> {
  ControllerCubit()
      : super(
          ControllerState(isWorking: false, status: Status.initial),
        );

  void changeVisibility() => emit(
        state.copyWith(isWorking: !state.isWorking),
      );
}
