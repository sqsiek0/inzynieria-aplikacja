import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';
import 'package:robot_controller/app/view/widgets/app_font_16.dart';
import 'package:robot_controller/app/view/widgets/app_font_32.dart';
import 'package:robot_controller/profile/view/widgets/profile_textfields.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  late final TextEditingController _nameController;
  late final TextEditingController _surnameController;
  late final TextEditingController _jobController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _jobController = TextEditingController();

    String oldName = _nameController.text;
    String oldSurname = _surnameController.text;
    String oldJob = _jobController.text;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.blue,
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50),
                      topRight: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: AppPaddings.globalPadding),
                child: CircleAvatar(
                  radius: 60,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(
                        Radius.circular(75),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: AppPaddings.globalPadding),
                child: AppFont32(text: 'Klaudiusz Kalinowski'),
              ),
            ),
            const Center(
              child: AppFont16(
                text: 'Młodszy programista',
                isBigMajorant: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileTextFields(
              nameController: _nameController,
              surnameController: _surnameController,
              jobController: _jobController,
            ),
          ],
        ),
      ],
    );
  }
}
