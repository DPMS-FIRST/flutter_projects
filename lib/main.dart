import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/LoginPage.dart';
import 'package:flutter_application_1/SampleLogin.dart';
import 'package:flutter_application_1/SampleSignUp.dart';
import 'package:flutter_application_1/get_start.dart';
import 'package:flutter_application_1/signup.dart';

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
      initialRoute: "getstart",
      routes: {
        "/getstart":((context) => GetStart()),
        "/login":((context) => LoginPage1()),
        "/signup":((context) => SignUp1()),
      },
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: GetStart(),
      //SignUp(),
      //LoginPage1(),
      //TextFieldDemo(),
      /*home:  Scaffold(
        appBar: AppBar(
          title: new Center(
              child: new Text("Column", textAlign: TextAlign.center)),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                color: Colors.orange,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ), */
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemo createState() => _TextFieldDemo();
}

class _TextFieldDemo extends State<TextFieldDemo> {
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: new InputDecoration(
                  labelText: "Cursor red and maxlength ten"),
              cursorColor: Colors.red,
              maxLength: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: new InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: new InputDecoration(
                  labelText: "Multiple line acceptance textfield"),
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Border TextField",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                ),
              ),
            ),
          ),
          TextField(
            obscureText:
                passenable, //if passenable == true, show **, else show password character
            decoration: InputDecoration(
                hintText: "Enter Password Here",
                labelText: "Password",
                suffix: IconButton(
                    onPressed: () {
                      //add Icon button at end of TextField
                      setState(() {
                        //refresh UI
                        if (passenable) {
                          //if passenable == true, make it false
                          passenable = false;
                        } else {
                          passenable =
                              true; //if passenable == false, make it true
                        }
                      });
                    },
                    icon: Icon(passenable == true
                        ? Icons.remove_red_eye
                        : Icons.password))
                //eye icon if passenable = true, else, Icon is ***__
                ),
          ),
        ],
      ),
    );
  }
}
