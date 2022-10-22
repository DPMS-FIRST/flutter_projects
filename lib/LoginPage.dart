import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage1 extends StatefulWidget {
  @override
  _LoginPage1 createState() => _LoginPage1();
}

class _LoginPage1 extends State<LoginPage1> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login Page',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Icon
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.person_outlined,
                size: 100.0,
                color: Colors.white,
              ),
            ),

            //email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.white,
                ),
                focusNode: myFocusNode,
                controller: _email,
                cursorColor: Colors.red,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.red : Colors.white),
                  labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Colors.red : Colors.white),
                ),
              ),
            ),
            
            //password textfield
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _password,
                  obscureText: passenable,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    hintStyle: TextStyle(
                        color:
                            myFocusNode.hasFocus ? Colors.red : Colors.white),
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
                      icon: Icon(passenable == true
                          ? Icons.visibility
                          : Icons.visibility_off,
                          color: Colors.white,
                        ),
                    ),
                  ),
                )),

            //MaterialButton
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                onPressed: () {
                  validateInputs();
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                height: 50.0,
                minWidth: 80.0,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }

/* 
Maximum 8 characters
Minimum 1 Upper case
Minimum 1 lowercase
Minimum 1 Numeric Number
Minimum 1 Special Character
Common Allow Character ( ! @ # $ & * ~ ) */

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
