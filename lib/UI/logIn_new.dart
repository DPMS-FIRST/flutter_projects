import 'package:first_app/widgets/input_textField.dart';
import 'package:first_app/widgets/show_alert.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isPasswordvisible = true;
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppInputTextField(
                // textColor: Colors.red,
                prefixIcon: Icon(Icons.person_off_outlined),
                controller: _name,
                hintText: "Please Enter name"),
            AppInputTextField(
                prefixIcon: Icon(Icons.password),
                controller: _password,
                isSecured: true,
                isVisible: _isPasswordvisible,
                onTap: () {
                  setState(() {
                    _isPasswordvisible = !_isPasswordvisible;
                  });
                },
                hintText: "Please Enter password"),
            Padding(
              padding: const EdgeInsets.only(
                  left: 143.5, right: 143.5, bottom: 32.0),
              child: Container(
                width: 127,
                height: 30,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password"),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 44.0, right: 44.0, bottom: 24.0),
              child: Container(
                width: 326,
                height: 50,
                color: const Color(0xFF8D99AE),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 100.5),
                  child: TextButton(
                    onPressed: () {
                      print("LogIn clickked");
                      showDialog(context: context, builder: (BuildContext context) => 
                       AppShowAlert(message: 'LogIn button clicked'));
                       
                      if (_formkey.currentState!.validate()) {}
                    },
                    child: Text("LogIn", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 67.5, right: 67.5, bottom: 100),
              child: Container(
                  width: 279,
                  height: 30,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                      children: [
                        Text("Didn't have any account?"),
                        TextButton(
                            onPressed: () {}, child: Text('Sign Up here')),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

/*
      Padding(
        padding: const EdgeInsets.only(left: 173.0,right: 172.0,top: 100.0, bottom: 33.0),
        child: Container(
          width: 69,
          height: 24,
        
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text('Login'))),
      ),
            Padding(
              padding: const EdgeInsets.only(left: 44.0,right: 44.0,bottom: 20.0),
              child: TextFormField(
                
                controller: _name,
                decoration: InputDecoration(hintText: 'Enter name',),
                validator: (value) {
                  if (value!.isEmpty) // final v=value ?? "";if(v.isEmmpty)
                  {
                    return "Please enter name";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 44.0,right: 44.0,bottom: 20.0),
              child: TextFormField(
                maxLength: 10,
                controller: _password,
                obscureText: _isPasswordvisible,
                decoration: InputDecoration(
                    hintText: 'Enter password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        print('Click');
                        setState(() {
                          _isPasswordvisible = !_isPasswordvisible;
                        });
                      },
                      child: Icon(Icons.remove_red_eye_outlined),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter password";
                  }
                  else {
                    if (!regex.hasMatch(value)) {
                   return 'Enter valid password';
                    } else {
                      return null;
                    }
                   }

                },
              ),
            ),
 */