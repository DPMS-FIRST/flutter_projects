import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemo createState() => _TextFieldDemo();
}

class _TextFieldDemo extends State<TextFieldDemo> {
  bool passenable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: new InputDecoration(
                  labelText: "Cursor red and maxlength ten"),
              cursorColor: Colors.red,
              maxLength: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: new InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: new InputDecoration(
                  labelText: "Multiple line acceptance textfield"),
              maxLines: null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Border TextField",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                ),
              ),
            ),
          ),
          TextField(
            obscureText:
                passenable, //if passenable == true, show **, else show password character
            decoration: InputDecoration(
                hintText: "Enter Password Here",
                labelText: "Password",
                suffix: IconButton(
                    onPressed: () {
                      //add Icon button at end of TextField
                      setState(() {
                        //refresh UI
                        if (passenable) {
                          //if passenable == true, make it false
                          passenable = false;
                        } else {
                          passenable =
                              true; //if passenable == false, make it true
                        }
                      });
                    },
                    icon: Icon(passenable == true
                        ? Icons.remove_red_eye
                        : Icons.password))
                //eye icon if passenable = true, else, Icon is ***__
                ),
          ),
        ],
      ),
    );
  }
}