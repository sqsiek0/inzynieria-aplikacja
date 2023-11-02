import 'package:bloc/bloc.dart';
import 'package:robot_controller/app/src/enums/enums.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState(appTabState: AppTabState.home)) {
    on<AppEvent>((event, emit) {});
    on<AppChangeTab>(_changeTab);
  }

  void _changeTab(
    AppChangeTab event,
    Emitter<AppState> emit,
  ) {
    try {
      emit(state.copyWith(appTabState: event.appTabState));
    } catch (e) {
      emit(state.copyWith(appTabState: AppTabState.failed));
    }
  }
}
