class GrievanceData {
  String? status;
  String? message;
  List<ViewGrievances>? viewGrievances;

  GrievanceData({this.status, this.message, this.viewGrievances});

  GrievanceData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['viewGrievances'] != null) {
      viewGrievances = <ViewGrievances>[];
      json['viewGrievances'].forEach((v) {
        viewGrievances!.add(ViewGrievances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (viewGrievances != null) {
      data['viewGrievances'] =
          viewGrievances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViewGrievances {
  String? flag;
  String? id;
  String? type;
  String? timestamp;
  String? status;
  String? category;
  String? assignedto;
  String? statusID;

  ViewGrievances(
      {this.flag,
      this.id,
      this.type,
      this.timestamp,
      this.status,
      this.category,
      this.assignedto,
      this.statusID});

  ViewGrievances.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    id = json['id'];
    type = json['type'];
    timestamp = json['timestamp'];
    status = json['status'];
    category = json['category'];
    assignedto = json['assignedto'];
    statusID = json['status_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['flag'] = flag;
    data['id'] = id;
    data['type'] = type;
    data['timestamp'] = timestamp;
    data['status'] = status;
    data['category'] = category;
    data['assignedto'] = assignedto;
    data['status_ID'] = statusID;
    return data;
  }
}
