
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_listview/providers/Display/model.dart';
import 'package:providers_listview/providers/Display/provider.dart';
import 'package:providers_listview/providers/ReusableComponents/Button.dart';
import 'package:providers_listview/providers/ReusableComponents/TextField.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final StateProvider = Provider.of<ProviderNotifier>(context);

    TextEditingController _nameController = TextEditingController();
    TextEditingController _numberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableTextField(
            controller: _nameController,
            hintext: "Enter name",
            prefixicon: Icon(Icons.person_outline),
          ),

          ReusableTextField(
            controller: _numberController,
            hintext: "Enter mobile number",
            prefixicon: Icon(Icons.call),
          ),

          ReusableButton(
            text: "submit", 
            onPressed: () {
                    StateProvider.addDetails(
                      UserModel(
                        name:_nameController.text, 
                        mobileNumber:_numberController.text
                        ),
                      );
                    Navigator.pop(context);
                  },)
          
        ],
      ),
    );
  }
}
