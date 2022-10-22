import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/LoginPage.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/get_start.dart';

import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.getstart: ((context) => GetStart()),
      AppRoutes.login: ((context) => LoginPage1()),
      AppRoutes.signup: ((context) => SignUp()),
    };
  }
}
