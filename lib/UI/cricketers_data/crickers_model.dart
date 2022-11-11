class CrickertModel {
  String? name;
  String? userId;
  String? role;
  String? gender;
  String? dob;
  String? userimage;
  String? country;
  //List<CrickertModel> cricketDetails;

  CrickertModel(
      {this.name,
      this.userId,
      this.role,
      this.gender,
      this.dob,
      this.userimage,
      this.country});

  CrickertModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['userId'];
    role = json['role'];
    gender = json['gender'];
    dob = json['dob'];
    userimage = json['userimage'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userId'] = this.userId;
    data['role'] = this.role;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['userimage'] = this.userimage;
    data['country'] = this.country;
    return data;
  }
}
