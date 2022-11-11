/*
Base Url: https://uat4.cgg.gov.in/blc/hcl/
endpoint : getBeneficiaryVillages
type: POST
headders:null
parameters:null
body: {
  "roleId": 12,
"categoryId": 1,
"userId": "TSDR-YEL-VKB",
"token":"T_ZSPVDlQ2gBd_AK4BNNIDYTB0KmWSAD"
}
autherization: null
 */

import 'package:dio/dio.dart';
import 'package:first_app/UI/village_detail_model.dart';
import 'package:first_app/UI/village_list_item.dart';
import 'package:flutter/material.dart';

class VillageList extends StatefulWidget {
  const VillageList({super.key});

  @override
  State<VillageList> createState() => _VillageListState();
}

class _VillageListState extends State<VillageList> {
  late VillageModel? _villageModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Village List"),
      ),
      body: Container(
          child: ListView.builder(
        itemCount: _villageModel?.villagDetails?.length ?? 0,
        itemBuilder: (context, index) {
          final villageData = _villageModel?.villagDetails?[index];
          return VillageListItem(details: villageData);
        },
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTheVillageDetails();
  }

  

  fetchTheVillageDetails() async {

//step1: create request url with base url and endpoint
    final requestUrl =
        "https://uat4.cgg.gov.in/blc/hcl/" + "getBeneficiaryVillages";
//step 2: create payload if request post ,put,option
    final requestPayload = {
      "roleId": 12,
      "categoryId": 1,
      "userId": "TSDR-YEL-VKB",
      "token": "T_ZSPVDlQ2gBd_AK4BNNIDYTB0KmWSAD"
    };

// step 3: create headders and autherazation

// step 4: dio or http use this package connect to server
    final _dioObject = Dio();

    try {
      final _response = await _dioObject.post(requestUrl, data: requestPayload);
      //convet this response from json to modelclass
      final villageDetailsModel = VillageModel.fromJson(_response.data);
      setState(() {
        this._villageModel = villageDetailsModel;
      });
      print(_response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
        final errorMessage = e.response?.data["message"];
        // showAlert(errorMessage);
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
// step 5: print the response
  }
}

/*
{} - > class 
{ //VillageModel
statuscode -> string
statusMessage -> string
villageDetails - List<VillageDetails>



}

class VillageDetails {
"village_id": 
            "village_name": 
            "roleId": 
            "userId": 
            "token": 
            "notuploaded_bens":
            "uploaded_bens": 
            "categoryId": 
            "approvedType": 

}
 */