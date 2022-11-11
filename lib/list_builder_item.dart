import 'package:flutter/material.dart';

class DemoItem extends StatelessWidget {
  const DemoItem(
      {super.key, required this.stateName, required this.callBackValue});
  final String stateName;
  //Create The Callback
  final Function(String value) callBackValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Call the callback
        callBackValue(stateName);
      },
      child: ListTile(
        title: Text(stateName),
        trailing: Icon(Icons.drive_eta_sharp),
        leading: Image.network("https://i.ibb.co/hMMFXQ0/laptop.jpg"),
        // leading: Image.asset("assets/laptop.jpeg",height: 50,width: 50),
        //https://i.ibb.co/hMMFXQ0/laptop.jpg
      ),
    );
  }
}

// listview->builder
//builder-listview

/*
1. create call back final Function(ParameterType value......) callBackName;
2. implement the call back
3. call the callback



// listview - listviewitem:
 */