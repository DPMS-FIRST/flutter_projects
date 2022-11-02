import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPageApi(),
    );
  }
}

class LoginPageApi extends StatefulWidget {
  const LoginPageApi({super.key});

  @override
  State<LoginPageApi> createState() => _LoginPageApiState();
}

class _LoginPageApiState extends State<LoginPageApi> {
  dynamic jsonResult;
  var lastName = TextEditingController();
  var firstName = TextEditingController();
  var Email = TextEditingController();
  var Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            //Image
            CircleAvatar(
            backgroundImage: NetworkImage(jsonResult['image']),
            radius: 100,
            ),
           
            row_component('LastName', jsonResult["lastname"]),
            row_component('FirstName', jsonResult["firstname"]),
            row_component('Email', jsonResult["email"]),
            row_component('Password', jsonResult["password"]),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        margin: EdgeInsets.symmetric(vertical: 12.0),
      ),
      
    );
  }


  Row row_component(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
        
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Text(value, style: TextStyle(color: Colors.purple, fontSize: 20)),
        )
      ],
    );
  }
    @override
  void initState() {
    super.initState();
    _fetchData();
  }  

  _fetchData() async {
    String data = await rootBundle.loadString('assets/details.json');
    
    setState(() {
      jsonResult = json.decode(data);
      lastName.text = jsonResult['lastname'];
      firstName.text = jsonResult['firstname'];
      Email.text = jsonResult['email'];
      Password.text = jsonResult['password'];
      //images = jsonResult['image'];
    });
  }
  
}
