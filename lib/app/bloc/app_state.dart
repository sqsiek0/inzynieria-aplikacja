// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppState {
  final AppTabState appTabState;
  AppState({
    required this.appTabState,
  });

  AppState copyWith({
    AppTabState? appTabState,
  }) {
    return AppState(
      appTabState: appTabState ?? this.appTabState,
    );
  }
}
