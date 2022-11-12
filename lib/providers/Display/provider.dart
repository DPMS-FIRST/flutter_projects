
import 'package:flutter/cupertino.dart';
import 'package:providers_listview/providers/Display/model.dart';

class ProviderNotifier with ChangeNotifier
{
  final List<UserModel> details = [];
  addDetails(UserModel value)
  {
    details.add(value);
    notifyListeners();
  }
}