import 'package:flutter/material.dart';

import 'list_builder_item.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  final statesList = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttarakhand",
    "Uttar Pradesh",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Lakshadweep",
    "Puducherry"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView Demo"),
        ),
        body: ListView.builder(
          itemCount: statesList.length,
          itemBuilder: (context, index) {
            print("print the index $index");
            final state = statesList[index];
            return DemoItem(
              stateName: state,
              callBackValue: (value) {
                showAlert(value);
              },
            );
          },
        ));
  }

/*
 GestureDetector(
      onTap: (){
           showAlert(state);
      },
      child: ListTile(
        title: Text(stateName),
        trailing: Icon(Icons.drive_eta_sharp),
        leading: Image.network("https://i.ibb.co/hMMFXQ0/laptop.jpg"),
        // leading: Image.asset("assets/laptop.jpeg",height: 50,width: 50),
        //https://i.ibb.co/hMMFXQ0/laptop.jpg
      ),
    );
 */
  showAlert(String message, {String text = ""}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message + text),
            actions: [
              TextButton(
                onPressed: () {
                  // print("button Action");
                  Navigator.pop(context);
                },
                child: Text("ok"),
                //style: ButtonStyle(backgroundColor:),
              )
            ],
          );
        });
  }
}



/*
"item 0"
item 1
item 2

ListView.builder
ListView
ListView.separated
//callback
//states display in list
//prepare the array 
//display the state names in listview
// display the country list
//


// screen1 listview with floatting button, when i click on button navigates to second screen
// In screen 2, take two textfield and button and validation. when i click on button append the two values and pass back to screen 1 and load in listview
 */