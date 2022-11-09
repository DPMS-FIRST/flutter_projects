import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ImgPicker extends StatefulWidget {
  const ImgPicker({super.key});

  @override
  State<ImgPicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImgPicker> {
  File? _image;
  Future getImage(ImageSource type) async {
    final img = await ImagePicker().pickImage(source: type);
    if (img == null) return;
    final tempimg = File(img.path);
    setState(() {
      this._image = tempimg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker")),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 40),
          _image != null
              ? Image.file(
                  _image!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGFwdG9wfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
                  height: 100,
                ),
          CustomButton(
              tit: "pick from gallery",
              ico: Icons.image_outlined,
              onclick: (() => getImage(ImageSource.gallery))),
          CustomButton(
              tit: "pick from camera",
              ico: Icons.camera,
              onclick: (() => getImage(ImageSource.camera)))
          // CustomButton(),
        ],
      )),
    );
  }
}

// ignore: non_constant_identifier_names
Widget CustomButton(
    {required String tit,
    required IconData ico,
    required VoidCallback onclick}) {
  return Container(
    width: 200,
    child: ElevatedButton(
      onPressed: onclick,
      child: Row(
        children: [Icon(ico), Text(tit)],
      ),
    ),
  );
}
