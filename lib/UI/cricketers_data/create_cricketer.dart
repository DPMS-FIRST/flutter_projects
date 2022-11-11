//image, name, gender, dob, team name, role , runs, country

import 'package:first_app/UI/cricketers_data/county_drop_down_component.dart';
import 'package:first_app/UI/cricketers_data/crickers_model.dart';
import 'package:first_app/UI/cricketers_data/notifer_list.dart';
import 'package:first_app/UI/cricketers_data/user_gender_component.dart';
import 'package:first_app/UI/cricketers_data/user_image_component.dart';
import 'package:first_app/UI/cricketers_data/user_retrieve_component.dart';
import 'package:first_app/widgets/input_textField.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../db/database_helper.dart';
//import 'counter_sample.dart';
import 'dob_selection_component.dart';

class CreateCricketers extends StatefulWidget {
  const CreateCricketers({super.key});

  @override
  State<CreateCricketers> createState() => _CreateCricketersState();
}

class _CreateCricketersState extends State<CreateCricketers> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Cricketers")),
      body: SingleChildScrollView(
        child: Column(
          children: [
        //image
        UserImageComponent(),
        
        //name
        AppInputTextField(
            prefixIcon: Icon(Icons.person),
            controller: _nameController,
            hintText: "Please Enter Name"),
        
        //radiobutton gender
        UserGenderComponent(),
        
        //calender date of birth
        UserDobComponent(),
        
        //dropdown country
        DropDownComponent(),
        
        //checkbox
        //UserRoleComponent(),
        
        //button submit
        TextButton(
            onPressed: () async {
              final date = DateFormat("yyyy/MM/dd").format(userDob.value);
        
              final cricketerData = CrickertModel(
                  gender: userGender.value,
                  dob: date,
                  name: _nameController.text,
                  role: "",
                  country: selectedCountry.value,
                  userId: Uuid().v1(),
                  userimage: userImagePath.value?.path ?? "");
        
              //checking the result
              print("print gender ${userGender.value}");
              print("print image file ${userImagePath.value?.path}");
              print("print dob ${userDob.value}");
              print("print country ${selectedCountry.value}");
              print("print role ${userRole.value}");
        
              //Database object
              final DatabaseHelper _databaseService = DatabaseHelper.instance;
        
              //insert into database
              final saved = await _databaseService.insertInto(
                  cricketerData.toJson(), "Cricketers");
        
              //number of records saved
              print("data saved $saved");
            },
            child: Text(
              "Submit",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
        
        TextButton(
            onPressed: () async {
              /* final DatabaseHelper _databaseService = DatabaseHelper.instance;
              final retrieve =
                  await _databaseService.getAllRecords("Cricketers");*/
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserRetrieveComponent()),
              );
              //print(retrieve);
            },
            child: Text("Retrieve"),
            )
          ],
        ),
      ),
    );
  }
}
