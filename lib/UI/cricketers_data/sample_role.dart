import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:first_app/UI/cricketers_data/sample_role.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class RoleComponent extends StatefulWidget {
  RoleComponent({super.key});


  @override
  State<RoleComponent> createState() => _RoleComponentState();
}

class _RoleComponentState extends State<RoleComponent> {
  
  final selectAllRoles = checkBoxState(title: "SelectAll");
  final selectMultipleRoles = [
  checkBoxState(title: "Bowler"),
  checkBoxState(title: "Batsman"),
  checkBoxState(title: "Wicket Keeper"),
  checkBoxState(title: "All Rounder"),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          buildGroupedCheckbox(selectAllRoles),
          Divider(color: Colors.black),
          ...selectMultipleRoles.map(buildCheckbox).toList(),
        ],
      ),
    );
  }
  
 Widget buildCheckbox(checkBoxState checkbox) {

     return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
            value: checkbox.value, 
            title: Text(checkbox.title),
            onChanged:(value) {
              setState(() {
                checkbox.value = value!;
              });
            },);
  }

  Widget buildGroupedCheckbox(checkBoxState checkbox) {
     return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
            value: checkbox.value, 
            title: Text(checkbox.title),
            onChanged:toggleGroupCheckBox
            );
  }

  void toggleGroupCheckBox(bool? value) {
    if(value == null) return;
  setState(() {
    selectAllRoles.value = value;
    selectMultipleRoles.forEach((element) { 
      element.value = value;
    });
  });
    
  }
}

class checkBoxState{
  final String title;
  bool? value;

  checkBoxState({required this.title, this.value = false});
}