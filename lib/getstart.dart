import 'package:flutter/material.dart';
import 'package:getstart/login.dart';
import 'package:getstart/signup.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getstart'),
      ),
      body: Center(
        child: Column(children: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Login()));
              },
           child: Text('Login'),),
          TextButton(onPressed: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()));
          }, child: Text('Sign Up'),),
        ]),
      ),
    );
  }
}