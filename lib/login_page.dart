import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordvisible = false;
  @override
  Widget build(BuildContext context) {
    //final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
        appBar: AppBar(title: Text("login")),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Text("data is ${arguments["name"]}"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.black)),

                        //labelText: "Eamil", //focused border
                        // set more border style like disabledBorder
                      ),
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Email";
                        } else if (!isValidEmail(value)) {
                          return "Please Enter Valid email";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: !_isPasswordvisible,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.update_sharp),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            print("click");
                            setState(() {
                              _isPasswordvisible = !_isPasswordvisible;
                            });

                            // setState(() {
                            //   _isPasswordvisible = !_isPasswordvisible;
                            // });
                          },
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Colors.black)),

                        //labelText: "Password", //focused border
                        // set more border style like disabledBorder
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        final v = value ?? "";
                        if (v.isEmpty) {
                          return "Please Enter Password";
                        } else if (!isValidPassword(value ?? "")) {
                          return "Please Enter Valid Password";
                        }
                        return null;
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        requestApiCallWithFormData();
                        // if (_formKey.currentState!.validate()) {
                        //   //
                        // }
                      },
                      child: Text("Submit")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Back")),
                  TextButton(
                      onPressed: () {
                       
                      },
                      child: Text("Take Picture")),
                ],
              ),
            ),
          ),
        ));
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.none,
              //maxLines: 5,
              // maxLength: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              controller: _passwordController,
              //maxLines: 5,
              // maxLength: 10,
            ),
          ),
          TextButton(
            onPressed: () {
              print("button Action");
              validateInputs();
            },
            child: Text("Log In"),
            //style: ButtonStyle(backgroundColor:),
          )
        ],
      ),
    );
  }*/

  //TextFormField

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isValidPassword(String password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}')
        .hasMatch(password);
  }

  validateInputs() {
    if (_emailController.text.isEmpty) {
      showAlert("Please enter email", text: "tsdfasfa");
    } else if (_passwordController.text.isEmpty) {
      showAlert("Please enter password");
    }
  }

  requestApiCallWithFormData() async {
    //step1: create request url with base url and endpoint
    final requestUrl = "http://voc.apptest.pw/api/" + "register";
//step 2: create payload if request post ,put,opton
    final requestPayload = {
      "_token": "EkaO7u29IO6kpuqgMHMurmn2X6Haolm64WzZe6GR",
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    final formDataPayload = FormData.fromMap(requestPayload);
// step 3: create headders and autherazation

// step 4: dio or http use this package connect to server
    final _dioObject = Dio();
    // _dioObject.options = BaseOptions(headers: {});
    final headerPayload = {
      "Content-Type":
          "multipart/form-data; boundary=<calculated when request is sent>"
    };
    try {
      final _response = await _dioObject.post(requestUrl,
          data: formDataPayload, options: Options(headers: headerPayload));
      print(_response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        showAlert(errorMessage);
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
  }

  requestForloginWithHeadders() async {
    //step1: create request url with base url and endpoint
    final requestUrl = "https://pqms-uat.cgg.gov.in/" + "pqms/mobileLogin";
//step 2: create payload if request post ,put,opton
    final requestPayload = {
      "IMEI": "9664f87bc73233ea",
      "deviceId": "9664f87bc73233ea",
      "password": "PQMS@2022",
      "username": "Rekha_Mobile"
    };
    // final data = FormData.fromMap(requestPayload);
// step 3: create headders and autherazation

// step 4: dio or http use this package connect to server
    final _dioObject = Dio();
    // _dioObject.options = BaseOptions(headers: {});
    final headerPayload = {
      "clientId": "Client123Cgg",
      "Content-Type": "application/json"
    };
    try {
      final _response = await _dioObject.post(requestUrl,
          data: requestPayload, options: Options(headers: headerPayload));
      print(_response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        showAlert(errorMessage);
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
  }

  requestLogin(BuildContext context) async {
//step1: create request url with base url and endpoint
    final requestUrl = "" + "authenticate";
//step 2: create payload if request post ,put,opton
    final requestPayload = {
      "password": _passwordController.text,
      "phoneNumber": _emailController.text
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
        showAlert(errorMessage);
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
// step 5: print the response
  }

  showAlert(String message, {String text = ""}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message + text),
            actions: [
              TextButton(
                onPressed: () {
                  // print("button Action");
                  Navigator.pop(context);
                },
                child: Text("ok"),
                //style: ButtonStyle(backgroundColor:),
              )
            ],
          );
        });
  }
}


/*

Crate 5 textfields
1. cursor color red, maxlenght 10
2. number keyboard
3. multile line accept
4. add border
5. password textfield
6. create login page with validations
7.

//30 - 70

// sign up validation

//1. Navigator-
//2. using named routes
//3. go router

//gestart - > 2 buttons a) login b) sign up



 */


/*


  requestLogin(BuildContext context) async {
//step1: create request url with base url and endpoint
    final requestUrl = ApiConstant.baseUrl + "authenticate";
//step 2: create payload if request post ,put,opton
    final requestPayload = {
      "password": _passwordcontroller.text,
      "phoneNumber": _phonenocontroller.text
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
/*
Base Url: http://164.52.213.195:8088/salex/
endpoint : authenticate
type: POST
headders:null
body: {
  "password": "Ak@123",
  "phoneNumber": "7205807205"
}
autherization: null

step1: create request url with base url and endpoint
step 2: create payload if request post ,put,opton  
step 3: create headders and autherazation
step 4: dio or http use this package connect to server
step 5: print the response


 */

 */