import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/LoginPage.dart';
import 'package:flutter_application_1/SampleLogin.dart';
import 'package:flutter_application_1/get_start.dart';
import 'package:flutter_application_1/routes/app_pages.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/textfield.dart';

// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: //SignUp(),
      LoginPage1(),
      //FormValidation1(),
    );
  }
}