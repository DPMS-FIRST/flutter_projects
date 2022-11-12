
import 'package:flutter/material.dart';
import 'package:providers_listview/providers/Display/ListDisplayScreen.dart';
import 'package:providers_listview/routes/app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      
       AppRoutes.ListDisplayScreen:((context) => const ListDisplayScreen()),
    };
  }
}
