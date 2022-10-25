import 'package:callbackproject/AddDetailsScreen.dart';
import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users(
      {super.key, required this.userDetails, required this.callBackValue});
  final UserDetails userDetails;
  //Create The Callback
  final Function(UserDetails userDetails) callBackValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Call the callback
        callBackValue(userDetails);
      },
      child: ListTile(
        title: Text("${userDetails.email}"),
        subtitle: Text("${userDetails.password}"),
      ),
    );
  }
}
