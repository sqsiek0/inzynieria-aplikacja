import 'package:flutter/material.dart';
import 'package:robot_controller/app/view/widgets/app_textfield_title.dart';

class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields(
      {super.key,
      required this.nameController,
      required this.surnameController,
      required this.jobController});
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController jobController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFieldTtile(
          title: 'Imię',
          controller: nameController,
          isEnd: false,
        ),
        AppTextFieldTtile(
          title: 'Nazwisko',
          controller: surnameController,
          isEnd: false,
        ),
        AppTextFieldTtile(
          title: 'Posada',
          controller: jobController,
          isEnd: true,
        ),
      ],
    );
  }
}
