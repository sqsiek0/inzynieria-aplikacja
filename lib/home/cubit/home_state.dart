// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final Placemark location;
  final Status status;

  HomeSuccess({
    required this.location,
    required this.status,
  });

  HomeSuccess copyWith({
    Placemark? location,
    Status? status,
  }) {
    return HomeSuccess(
      location: location ?? this.location,
      status: status ?? this.status,
    );
  }
}

class HomeFailed extends HomeState {
  final String message;
  final Status status;

  HomeFailed({
    required this.message,
    required this.status,
  });

  HomeFailed copyWith({
    String? message,
    Status? status,
  }) {
    return HomeFailed(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
