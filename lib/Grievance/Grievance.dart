/*
Base Url: https://19cghmc.cgg.gov.in/myghmcwebapi/
endpoint : Grievance/viewGrievances
type: POST
headders:null
parameters:null
body: {
    "mobileno":"9985074116",
    "password":"ghmc@cgg@2018",
    "userid":"cgg@ghmc"
}
autherization: null
 */

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:listview_modelclass/ApiConstants/Constants.dart';
import 'package:listview_modelclass/Grievance/Grievance_ListView.dart';
import 'package:listview_modelclass/Grievance/GrievanceData.dart';

class Grievance extends StatefulWidget {
  const Grievance({super.key});

  @override
  State<Grievance> createState() => _GrievanceState();
}

class _GrievanceState extends State<Grievance> {
  //creating a variable for grievance model class GrievanceData
  GrievanceData? _grievanceData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grievance List"),
      ),
      body: Container(
          child: ListView.builder(
        //length of modal class GrievanceData and ViewDetails list
        itemCount: _grievanceData?.viewGrievances?.length ?? 0,
        itemBuilder: (context, index) {
          final data = _grievanceData?.viewGrievances?[index];
          return Grievance_ListView(details: data);
        },
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    GrievanceDetails();
  }

  GrievanceDetails() async {
    //creating request url with base url and endpoint
    final requesturl =
        ApiConstants.grievanceBaseUrl + ApiConstants.grievanceEndPoint;

    //creating payload because request type is POST
    var requestPayload = {
      "mobileno":"9985074116",
      "password":"ghmc@cgg@2018",
      "userid":"cgg@ghmc"
    };

    //no headers and authorization

    //creating dio object in order to connect package to server
    final dioObject = Dio();

    try {
      final response = await dioObject.post(
        requesturl, 
      data: requestPayload,
      options:Options(
        headers:{
          HttpHeaders.contentTypeHeader:"application/json",
        }
      ), 
       );

      //converting response from String to json
      final data = GrievanceData.fromJson(response.data);
      setState(() {
        _grievanceData = data;
        print("${_grievanceData!.viewGrievances!.length}");
       // print("lavanya ${_grie/vanceData.viewGrievances}");
      });
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        //final errorMessage = e.response?.data["message"];
        // showAlert(errorMessage);
      }
      print("error is $e");

      //print("status code is ${e.response?.statusCode}");
    }
// step 5: print the response
  }
}
