class GetCurrentVersion {
  String? statusMessage;
  int? statusCode;
  String? data;

  GetCurrentVersion({this.statusMessage, this.statusCode, this.data});

  GetCurrentVersion.fromJson(Map<String, dynamic> json) {
    statusMessage = json['status_Message'];
    statusCode = json['status_Code'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_Message'] = this.statusMessage;
    data['status_Code'] = this.statusCode;
    data['data'] = this.data;
    return data;
  }
}
