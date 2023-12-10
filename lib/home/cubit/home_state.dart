// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final Placemark location;
  final double longitude;
  final double latitude;
  final bool isWorking;

  final Status status;

  HomeSuccess({
    required this.location,
    required this.longitude,
    required this.latitude,
    required this.status,
    this.isWorking = false,
  });

  HomeSuccess copyWith({
    Placemark? location,
    double? longitude,
    double? latitude,
    bool? isWorking,
    Status? status,
  }) {
    return HomeSuccess(
      location: location ?? this.location,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      isWorking: isWorking ?? this.isWorking,
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
