import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:universal_io/io.dart';

class AppShowAlert extends StatelessWidget {
  const AppShowAlert({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return new Center(child: (() {
      
      print('OS: ${Platform.operatingSystem}');
      if (defaultTargetPlatform == TargetPlatform.android) {
       
        new AlertDialog(title: Text(message), actions: [
          TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text("OK"))
        ]);
      }
      else
      {
        new CupertinoAlertDialog(title: Text(message), actions: [
          TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Text("OK"))
        ]);
      }
      ;
    })());
  }
}




