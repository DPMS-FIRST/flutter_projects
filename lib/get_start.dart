import 'package:first_app/constants/image_contants.dart';
import 'package:first_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetStart")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(ImageConstants.getStartSvg),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.login);
                // Navigator.pushNamed(context, AppRoutes.login,
                //     arguments: {"name": "hello"});
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Login")),
          TextButton(
              onPressed: () {
                // Navigator.of(context).push(
                //     MaterialPageRoute(builder: (context) => SignupScreen()));
                Navigator.pushNamed(context, AppRoutes.signup);
              },
              child: Text("Sign up"))
        ],
      )),
    );
  }
}


//10 routes
//1) getstart,2)login,3)sign up, 4)fortgot password, 5)address add, 6)otp screen,7)dashboard,8)settings, 9)profile, 
// -1->2->3->4
//1->3->6>7>3->6


//login 1.text field 2. textfile 3. button - >navigate to home page display the 1+2 values


