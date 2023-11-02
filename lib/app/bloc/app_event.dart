// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppEvent {}

class AppChangeTab extends AppEvent {
  final AppTabState appTabState;

  AppChangeTab({
    required this.appTabState,
  });
}
