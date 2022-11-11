import 'package:first_app/UI/cricketers_data/sample_role.dart';
import 'package:first_app/UI/cricketers_data/user_role_component.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ValueNotifier<int> counter = ValueNotifier(0);
ValueNotifier<XFile?> userImagePath = ValueNotifier(null);
ValueNotifier<String?> userGender = ValueNotifier(null);
ValueNotifier<DateTime> userDob = ValueNotifier(DateTime.now());
ValueNotifier<String?> selectedCountry = ValueNotifier(null);
//ValueNotifier<bool?> userRole = ValueNotifier(false);

ValueNotifier<List<CheckBoxitems>> userRole = ValueNotifier(
  [
    
  ]
);
