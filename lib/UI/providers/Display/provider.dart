import 'package:first_app/UI/providers/Display/model.dart';
import 'package:flutter/cupertino.dart';

class ProviderNotifier with ChangeNotifier
{
  final List<UserModel> details = [];
  addDetails(UserModel value)
  {
    details.add(value);
    notifyListeners();
  }
}