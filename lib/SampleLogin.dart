import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: TextField(
              controller: _emailController,
              maxLength: 10,
              keyboardType: TextInputType.none,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              maxLength: 10,
            ),
          ),
          TextButton(
            onPressed: () {
              print("button Action");
              validateInputs();
            },
            child: Text('Login',
            style: TextStyle(
              color: Colors.black,
            ),
            ),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
          ),
          Container(),
        ],
      ),
    );
  }

  validateInputs() {
    if (_emailController.text.isEmpty) {
      showAlert("Please enter email");
    } else if (_passwordController.text.isEmpty) {
      showAlert("please enter email");
    }
  }

  showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("message"),
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
