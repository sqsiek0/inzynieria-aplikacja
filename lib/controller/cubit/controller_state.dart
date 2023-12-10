// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'controller_cubit.dart';

class ControllerState {
  final bool isWorking;
  final Status status;
  final bool isLoading;

  ControllerState({
    this.isWorking = false,
    required this.status,
    this.isLoading = false,
  });

  ControllerState copyWith({
    bool? isWorking,
    Status? status,
    bool? isLoading,
  }) {
    return ControllerState(
      isWorking: isWorking ?? this.isWorking,
      status: status ?? this.status,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
