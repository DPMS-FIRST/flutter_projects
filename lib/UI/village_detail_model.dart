class VillageModel {
  String? statusCode;
  String? statusMessage;
  List<VillagDetails>? villagDetails;

  VillageModel({this.statusCode, this.statusMessage, this.villagDetails});

  VillageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
    if (json['villagDetails'] != null) {
      villagDetails = <VillagDetails>[];
      json['villagDetails'].forEach((v) {
        villagDetails!.add(new VillagDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['statusMessage'] = this.statusMessage;
    if (this.villagDetails != null) {
      data['villagDetails'] =
          this.villagDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VillagDetails {
  String? villageId;
  String? villageName;
  String? roleId;
  String? userId;
  String? token;
  String? notuploadedBens;
  String? uploadedBens;
  String? categoryId;
  String? approvedType;

  VillagDetails(
      {this.villageId,
      this.villageName,
      this.roleId,
      this.userId,
      this.token,
      this.notuploadedBens,
      this.uploadedBens,
      this.categoryId,
      this.approvedType});

  VillagDetails.fromJson(Map<String, dynamic> json) {
    villageId = json['village_id'];
    villageName = json['village_name'];
    roleId = json['roleId'];
    userId = json['userId'];
    token = json['token'];
    notuploadedBens = json['notuploaded_bens'];
    uploadedBens = json['uploaded_bens'];
    categoryId = json['categoryId'];
    approvedType = json['approvedType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['village_id'] = this.villageId;
    data['village_name'] = this.villageName;
    data['roleId'] = this.roleId;
    data['userId'] = this.userId;
    data['token'] = this.token;
    data['notuploaded_bens'] = this.notuploadedBens;
    data['uploaded_bens'] = this.uploadedBens;
    data['categoryId'] = this.categoryId;
    data['approvedType'] = this.approvedType;
    return data;
  }
}

