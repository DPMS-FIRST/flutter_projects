import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormValidation1 extends StatefulWidget {
  @override
  _FormValidation1 createState() => _FormValidation1();
}

class _FormValidation1 extends State<FormValidation1> {
  TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller: _email,
                    validator: (value) {
                      final v = value ?? "";
                      if (v.isEmpty) {//value!.isEmpty
                        return "Please Enter Email";
                      } else if (!isValidEmail(v)) {
                        return "Please Enter Valid Email Address";
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        child: Icon(Icons.remove_red_eye_outlined),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    controller: _email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else if (!isValidPassword(value)) {
                        return "Please Enter Valid Password";
                      }
                      return null;
                    }),
              ),
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(password);
  }
}
