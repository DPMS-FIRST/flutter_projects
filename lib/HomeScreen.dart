import 'package:flutter/material.dart';
import 'AddDetailsScreen.dart';
import 'listview_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

//empty list
  List<UserDetails> userDetailsList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Added ListView Page"),
      ),
      body: ListView.builder(
        itemCount: userDetailsList.length,
        itemBuilder: (context, index) {
          final userData = userDetailsList[index];

          return Users(
            userDetails: userData,
            //Implement the call back
            callBackValue: (userData) {
              showAlert(userData);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            // Create the SelectionScreen in the next step.
            MaterialPageRoute(builder: (context) => const AddDetailsScreen()),
          );

          setState(() {
            userDetailsList.add(result);
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  showAlert(UserDetails userDetails) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("${userDetails.email} ${userDetails.password}"),
            actions: [
              TextButton(
                onPressed: () {
                  // print("button Action");
                  Navigator.pop(context);
                },
                child: const Text("Ok"),
                //style: ButtonStyle(backgroundColor:),
              )
            ],
          );
        }); 
  }
}
