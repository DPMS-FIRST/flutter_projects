import 'package:api_or_webservice_project/Api_constants/constants.dart';
import 'package:api_or_webservice_project/Reusable/button.dart';
import 'package:api_or_webservice_project/Reusable/textfield.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'web_services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const login_page(),
    );
  }
}

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController _password = new TextEditingController();
  TextEditingController _phonenumber = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isPasswordvisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('gift.json'),
              TextFieldDesign(
                  // textColor: Colors.red,
                  prefixIcon: Icon(Icons.mail_outline),
                  controller: _password,
                  hintText: "password"),
              TextFieldDesign(
                  prefixIcon: Icon(Icons.lock_outline),
                  controller: _phonenumber,
                  isSecured: true,
                  isVisible: _isPasswordvisible,
                  onTap: () {
                    setState(() {
                      _isPasswordvisible = !_isPasswordvisible;
                    });
                  },
                  hintText: "phonenumber"),
              ElevatedButton(
                onPressed: () {
                  requestLogin();
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  requestLogin() async {
//step1: create request url with base url and endpoint
    const requestUrl = ApiConstants.baseurl + ApiConstants.endurl;
//step 2: create payload if request post ,put,opton
    final requestPayload = {
      "password": _password.text,
      "phoneNumber": _phonenumber.text,
    };
// step 3: create headders and autherazation
// step 4: dio or http use this package connect to server
    final _dioObject = Dio();
    try {
      final _response = await _dioObject.post(requestUrl, data: requestPayload);
      print(_response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(errorMessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("ok"))
              ],
            );
          },
        );
      }
      print("error is $e");
      print("status code is ${e.response?.statusCode}");
    }
// step 5: print the response
  }
}
