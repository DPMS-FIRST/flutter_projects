import 'package:first_app/constants/image_contants.dart';
import 'package:first_app/shared_preferences/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              TextButton(
                  onPressed: () {
                    SharedPreferencesClass().writeTheData("userId", "123");
                  },
                  child: Text("save")),
              TextButton(
                  onPressed: () async {
                    final value =
                        await SharedPreferencesClass().readTheData("userId");
                    print("read value is $value");
                  },
                  child: Text("read")),
              TextButton(
                  onPressed: () {
                    final value =
                        SharedPreferencesClass().deleteTheData("userId");
                  },
                  child: Text("delete")),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 34, left: 85, right: 85),
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 2.4,
                    letterSpacing: 0.04,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 0, right: 40, bottom: 20),
                child: SizedBox(
                  width: 326,
                  height: 50,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(Icons.mail_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: UnderlineInputBorder(),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Email";
                      } else if (isValidEmail(value)) {
                        return "Please Enter a Valid Email";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SizedBox(
                  width: 326,
                  height: 50,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Password";
                      } else if (isValidPassword(value)) {
                        showAlert("""Please Enter valid Password with
                                                  Minimum one UppercaseCharacter
                                                  Minimum one specialCharacter
                                                  Minimum length of 8 Characters
                                                  Minimum one lowerCaseCharacter""");
                        return "Please Enter a Valid Password";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: SizedBox(
                  width: 326,
                  height: 50,
                  child: TextFormField(
                    obscureText: !_isPasswordVisible,
                    controller: _passwordConfirmController,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        height: 0.2,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      errorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Re-Enter your Password";
                      } else if (value != (_passwordController.text)) {
                        return "Password doesn't match";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Container(
                  width: 326,
                  color: Colors.black38,
                  child: SizedBox(
                    width: 326,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                            style: TextStyle(color: Colors.white), "Sign Up")),
                  ),
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageConstants.Applesvg,
                    width: 52,
                    height: 52,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 158,
                    height: 1,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    child: Text('Or',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            height: 1)),
                  ),
                  Container(
                    width: 158,
                    height: 1,
                    color: Colors.black,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you have an account?",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 0.02,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In here",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.02,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  bool isValidPassword(String password) {
    return (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password));
  }

  bool isValidEmail(String email) {
    return (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email));
  }
}

class SvgAssets {
  SvgAssets._();

  static const String facebook = "SvgAssets/FacebookAuth.svg";
  static const String apple = "SvgAssets/AppleAuth.svg";
  static const String google = "SvgAssets/GoogleAuth.svg";
}
/**Centre for Good Governance Survey No. 91, Near Outer Ring Road Chowrasta, Gachibowli, Hyderabad 500 032, Telangana, India. */