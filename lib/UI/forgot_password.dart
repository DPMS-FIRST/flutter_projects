import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgot_password extends StatefulWidget {
  const Forgot_password({super.key});

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

class _Forgot_passwordState extends State<Forgot_password> {
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 72.0, left: 0.0, right: 0.0, bottom: 0.0),
              child: Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "It’s okay! Reset your password",
                style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                  hintText: ("Email"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  if(validateField()){
                    //Navigate
                  }
                },
                child: Text("Continue"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Remember Your Password ?",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //Navigate to login
                    },
                    child: Text(
                      "Back to Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validateField() {
    if (_email.text.isEmpty) {
      showAlert("Please enter Email");
      return false;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(_email.text)) {
      showAlert("Please Enter valid ");
      return false;
    }
    return true;
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
