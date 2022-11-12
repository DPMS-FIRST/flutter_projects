
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_listview/providers/Display/AddScreen.dart';
import 'package:providers_listview/providers/Display/provider.dart';

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
            shadowColor: Colors.black12,
            elevation: 8.0,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text(
                  details.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              
                Text(details.mobileNumber!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                
              ]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddScreen()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
