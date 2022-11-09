

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImageComponent extends StatefulWidget {
  const UserImageComponent({super.key});

  @override
  State<UserImageComponent> createState() => _UserImageComponentState();
}

class _UserImageComponentState extends State<UserImageComponent> {

  ValueNotifier<String> filePath = ValueNotifier("");
  final _picker = ImagePicker();
  String filepath = "";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
        child: filepath.isEmpty? Image.asset(""): Image.file(File(filepath)),
    );
  }
}