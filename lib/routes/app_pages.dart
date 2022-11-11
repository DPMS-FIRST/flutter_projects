import 'package:first_app/UI/Reset_Password.dart';
import 'package:first_app/UI/TextField.dart';
import 'package:first_app/UI/cricketers_data/create_cricketer.dart';
import 'package:first_app/UI/cricketers_data/user_retrieve_component.dart';
import 'package:first_app/UI/cricketers_data/user_role_component.dart';
import 'package:first_app/UI/forgot_password.dart';
import 'package:first_app/UI/providers/CounterViewPage.dart';
import 'package:first_app/UI/village_list.dart';
import 'package:first_app/list_view.dart';
import 'package:first_app/products/products_list.dart';
import 'package:first_app/routes/app_routes.dart';
import 'package:first_app/signup_page.dart';
import 'package:flutter/material.dart';

import '../UI/logIn_new.dart';
import '../get_start.dart';
import '../login_page.dart';
import '../signup.dart';

class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.getstart: ((context) => GetStart()),
      AppRoutes.login: ((context) => LoginPage()),
      AppRoutes.signup: ((context) => SignupScreen()),
      AppRoutes.homePage: ((context) => Container()),
      AppRoutes.listView: ((context) => ListViewDemo()),
      AppRoutes.signUpPage: (context) => SignUpPage(),
      AppRoutes.textFieldDesign: ((context) => TextFieldDesign()),
      AppRoutes.forgotPwd: ((context) => Forgot_password()),
      AppRoutes.resetpwd: ((context) => Reset_Password()),
      AppRoutes.login_page: ((context) => login_page()),
      AppRoutes.productList: ((context) => ProductsList()),
      AppRoutes.villageList: ((context) => VillageList()),
      AppRoutes.cricketers: ((context) => CreateCricketers()),
      AppRoutes.UserRoleComponent: ((context) => UserRoleComponent()),
      AppRoutes.UserRetrieveComponent:((context) => UserRetrieveComponent()),
      AppRoutes.CounterPageView:((context) => CounterPageView()),
    };
  }
}
