/* import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:first_app/UI/cricketers_data/sample_role.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class UserRoleComponent extends StatefulWidget {
  UserRoleComponent({super.key});


  @override
  State<UserRoleComponent> createState() => _UserRoleComponentState();
}

class _UserRoleComponentState extends State<UserRoleComponent> {
  
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
} */

import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:flutter/material.dart';

class UserRoleComponent extends StatelessWidget {
  UserRoleComponent({super.key});

  final selectMultipleRoles = [
    CheckBoxitems(title: "Bowler"),
    CheckBoxitems(title: "Batsman"),
    CheckBoxitems(title: "Wicket Keeper"),
    CheckBoxitems(title: "All Rounder"),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userRole.value.length,
      itemBuilder: (context, index) {
        
        return ValueListenableBuilder(
          valueListenable: userRole,
          builder: (context, value, child) {
            return CheckboxListTile(
              value: userRole.value[index].status,
              onChanged: (value) {
                userRole.value[index].status = value;
              },
            );
          },
        ); /* CheckboxListTile(
              title: Text("checkbox"), 
              onChanged: (bool? value) { 
                  
               }, value: false,
            ); */
      },
    );
  }
}

class CheckBoxitems {
  final String title;
  late bool? status;

  CheckBoxitems({required this.title, this.status = false});
}
