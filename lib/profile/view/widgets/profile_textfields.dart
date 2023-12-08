import 'package:flutter/material.dart';
import 'package:robot_controller/app/view/widgets/app_textfield_title.dart';

class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields({
    super.key,
    required this.nameController,
    required this.surnameController,
    required this.jobController,
    this.onChanged,
  });
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController jobController;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFieldTtile(
          title: 'Imię',
          controller: nameController,
          isEnd: false,
          onChanged: onChanged,
        ),
        AppTextFieldTtile(
          title: 'Nazwisko',
          controller: surnameController,
          isEnd: false,
          onChanged: onChanged,
        ),
        AppTextFieldTtile(
          title: 'Posada',
          controller: jobController,
          isEnd: true,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
