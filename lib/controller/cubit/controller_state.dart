// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'controller_cubit.dart';

class ControllerState {
  final bool isWorking;
  final Status status;

  ControllerState({
    required this.isWorking,
    required this.status,
  });

  ControllerState copyWith({
    bool? isWorking,
    Status? status,
  }) {
    return ControllerState(
      isWorking: isWorking ?? this.isWorking,
      status: status ?? this.status,
    );
  }
}
