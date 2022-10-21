import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: Colors.indigo.shade900,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Text(
                      'Login Using Social Media to Get Quick Access',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: MaterialButton(
                        onPressed: () {
                          validateInputs();
                        },
                        child: Text(
                          "Sign in with Google",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                        height: 50.0,
                        minWidth: 80.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: MaterialButton(
                        onPressed: () {
                          validateInputs();
                        },
                        child: Text(
                          "Sign in with Facebook",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blueAccent,
                        height: 50.0,
                        minWidth: 80.0,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('---- OR ----',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: MaterialButton(
                        onPressed: () {
                          validateInputs();
                        },
                        child: Text(
                          "Sign in with Twitter",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.lightBlueAccent,
                        height: 50.0,
                        minWidth: 80.0,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          Expanded(
            flex: 4,
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.person_outlined,
                      size: 100.0,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        focusNode: myFocusNode,
                        controller: _email,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: "Username",
                          hintStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : Colors.blue),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: _password,
                        obscureText: passenable,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : Colors.blue),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                if (passenable) {
                                  passenable = false;
                                } else {
                                  passenable = true;
                                }
                              });
                            },
                            icon: Icon(
                              passenable == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              //color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        controller: _password,
                        obscureText: passenable,
                        cursorColor: Colors.red,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Colors.red
                                  : Colors.blue),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                if (passenable) {
                                  passenable = false;
                                } else {
                                  passenable = true;
                                }
                              });
                            },
                            icon: Icon(
                              passenable == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              //color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: MaterialButton(
                        onPressed: () {
                          validateInputs();
                        },
                        child: Text(
                          "signin",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                        height: 50.0,
                        minWidth: 80.0,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  validateInputs() {
    if (_email.text.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(_email.text)) {
      showAlert("please enter valid email");
    } else if (_password.text.isEmpty ||
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(_password.text)) {
      showAlert("Please enter valid password");
    }
  }

  showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok')),
            ],
          );
        });
  }
}
