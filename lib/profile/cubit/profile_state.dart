// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

class ProfileState {
  final String name;
  final String surname;
  final String job;
  final Status status;

  const ProfileState({
    required this.name,
    required this.surname,
    required this.job,
    required this.status,
  });

  ProfileState copyWith({
    String? name,
    String? surname,
    String? job,
    Status? status,
  }) {
    return ProfileState(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      job: job ?? this.job,
      status: status ?? this.status,
    );
  }
}
