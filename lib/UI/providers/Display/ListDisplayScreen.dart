import 'package:first_app/UI/providers/Display/AddScreen.dart';
import 'package:first_app/UI/providers/Display/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListDisplayScreen extends StatelessWidget {
  const ListDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StateProvider = Provider.of<ProviderNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: ListView.builder(
        itemCount: StateProvider.details.length,
        itemBuilder: (context, index) {
          final details = StateProvider.details[index];
          return Card(
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                  details.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              
                Text(details.mobileNumber!,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                
              ]),
            ),
            shadowColor: Colors.black12,
            elevation: 8.0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
