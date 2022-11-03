import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:listview_modelclass/ApiConstants/Constants.dart';
import 'package:listview_modelclass/GetCurrentVersion.dart';

class VersionCheck extends StatefulWidget {
  const VersionCheck({super.key});

  @override
  State<VersionCheck> createState() => _VersionCheckState();
}

class _VersionCheckState extends State<VersionCheck> {
  late GetCurrentVersion getCurrentVersion;
  @override
  void initState() {
    super.initState();
    versionCheckServiceCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Version"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Status_Code_Row(
              "StatusCode",
              getCurrentVersion.statusCode.toString(),
            ),
            Status_Code_Row(
              "StatusMessage",
              getCurrentVersion.statusMessage,
            ),
          ],
          /* Status_Code_Row(
                  "StatusCode",
                  "{$getCurrentVersion.statusCode}"
              ), */
        ),
      ),
    );
  }

  versionCheckServiceCall() async {
    //creating request url with baseurl and endpoint
    const requesturl = ApiConstants.baseurl + ApiConstants.endpoint;

    //creating payload because request type is POST
    //Body - form-data

    final requestPayload = {
      "osType": "android",
    };

    //create headers and authorization

    //dio object
    final _dioObject = Dio();
    try {
      final _response = await _dioObject.post(requesturl,
          data: requestPayload,
          options: Options(contentType: Headers.formUrlEncodedContentType));
          setState(() {
             getCurrentVersion = GetCurrentVersion.fromJson(_response.data);
          });
     
      //print(_response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(errorMessage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("ok"))
              ],
            );
          },
        );
      }
      print("error is $e");
      print("status code is ${e.response?.statusCode}");
    }
// step 5: print the response
  }
}

Row Status_Code_Row(String title, String? statusCode) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(statusCode!,
            style: TextStyle(color: Colors.purple, fontSize: 20)),
      )
    ],
  );
}
