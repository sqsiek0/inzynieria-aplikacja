import 'package:flutter/material.dart';
import 'package:robot_controller/app/src/constants/paddings.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

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
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(''),
            )
          ],
        ),
      ],
    );
  }
}
