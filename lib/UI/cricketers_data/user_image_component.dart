import 'dart:io';

import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImageComponent extends StatelessWidget {
  const UserImageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        final imageFile =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        userImagePath.value = imageFile;
      }),
      child: ValueListenableBuilder(
        valueListenable: userImagePath,
        builder: (context, value, child) {
          return value == null
              ? Image.asset("assets/laptop.jpeg")
              : Image.file(File(value.path));
        },
      ),
    );
  }
}
