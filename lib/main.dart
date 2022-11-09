import 'dart:io';

import 'package:cam_gallery_project/imaage_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';

import 'Cricketers_data/create_cricketer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CreateCricketers(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  File? image;
  Future pickImage(ImageSource type) async {
    try {
      final img = await ImagePicker().pickImage(source: type);
      if (img == null) return;
      final imageTemp = File(img.path);

      setState(() => image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 40),
          image != null
              ? Image.file(
                  image!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
            :Image.network(
              "https://images.unsplash.com/photo-1659535979248-bf5954d21328?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
              height: 150.0,
            ),
            const Text("click the attachment below"),
            IconButton(
              icon: const Icon(Icons.attachment),
              iconSize: 50,
              color: Colors.blue,
              onPressed: () {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return Dialog(
                        insetPadding: const EdgeInsets.all(80.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(height: 40),
                            image != null
                                ? Image.file(
                                    image!,
                                    width: 250,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  )
                                : 
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              iconSize: 50.0,
                              onPressed: () {
                                pickImage(ImageSource.camera);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.photo),
                              iconSize: 50.0,
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        ));
                  },
                  animationType: DialogTransitionType.slideFromBottomFade,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(seconds: 1),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  
}
