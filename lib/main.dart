/* 
Base url : https://pqms-uat.cgg.gov.in/pqms/
end point: getCurrentAppVersion
Type: POST
body: form-data
      osType:android]
Headers: null
Authorisation: null
 */



import 'package:flutter/material.dart';
import 'package:listview_modelclass/routes/app_pages.dart';
import 'package:listview_modelclass/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      routes: AppPages.routes,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), 
    );
  }
}

