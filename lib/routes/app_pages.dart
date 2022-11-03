import 'package:flutter/material.dart';
import 'package:listview_modelclass/Grievance/Grievance.dart';
import 'package:listview_modelclass/VersionCheck.dart';
import 'package:listview_modelclass/routes/app_routes.dart';


class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.Grievance: (context) => const Grievance(),
      AppRoutes.VersionCheck: (context) => const VersionCheck(),
    };
  }
}