import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:robot_controller/app/hive/models/profile_model.dart';
import 'package:robot_controller/app/src/enums/enums.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(
          const ProfileState(
            name: '',
            surname: '',
            job: '',
            status: Status.initial,
          ),
        );

  void fetchData() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final profileBox = await Hive.openBox<ProfileModel>('profile');
      final profileInfo = profileBox.get('profileInfo');
      if (profileInfo == null) {
        await profileBox.put(
          'profileInfo',
          ProfileModel(
            name: 'Brak imienia',
            surname: '',
            job: '',
          ),
        );
        emit(
          state.copyWith(
              status: Status.success,
              name: profileBox.get('profileInfo')?.name),
        );
      } else {
        emit(
          state.copyWith(
            status: Status.success,
            name: profileInfo.name,
            surname: profileInfo.surname,
            job: profileInfo.job,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: Status.failed));
    }
  }
}
