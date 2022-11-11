import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:group_radio_button/group_radio_button.dart';

class UserGenderComponent extends StatelessWidget {
  UserGenderComponent({super.key});
  final genderList = ["Male", "Female", "Others"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please Select Gender",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
        ValueListenableBuilder(
          valueListenable: userGender,
          builder: (context, value, child) {
            return RadioGroup<String>.builder(
              groupValue: value ?? "",
              onChanged: (value) {
                userGender.value = value;
              },
              items: genderList,
              itemBuilder: (item) => RadioButtonBuilder(
                item,
              ),
            );
          },
        ),
      ],
    );
  }
}
