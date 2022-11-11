import 'package:first_app/widgets/TextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Reset_Password extends StatefulWidget {
  const Reset_Password({super.key});

  @override
  State<Reset_Password> createState() => _Reset_PasswordState();
}

class _Reset_PasswordState extends State<Reset_Password> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _pwdagainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: _formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 64, right: 65, top: 72),
                child: Container(
                  width: 285,
                  height: 24,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Reset Your Password?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontFamily: "Poppins"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 72, right: 74, top: 8),
                child: Container(
                  width: 268,
                  height: 32,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      """We have sent a four digit code 
               on your email.""",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.04),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, top: 38),
                child: Container(
                  height: 50,
                  width: 326,
                  child: TextFormField(
                    controller: _numberController,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "enter passcode";
                      }
                    }),
                    decoration: InputDecoration(
                      hintText: "Four digit code",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, top: 19),
                child: Container(
                  height: 50,
                  width: 326,
                  child: TextFormField(
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "enter password!";
                      }
                    }),
                    controller: _pwdController,
                    decoration: InputDecoration(
                      hintText: "New Password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 44, right: 44, top: 19),
                child: Container(
                  height: 50,
                  width: 326,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm Password";
                      }
                    },
                    controller: _pwdagainController,
                    decoration: InputDecoration(
                      hintText: "Confirmation new password",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              textButton(text: "Reset Password")
            ],
          ),
        ),
      ),
    );
  }
}
