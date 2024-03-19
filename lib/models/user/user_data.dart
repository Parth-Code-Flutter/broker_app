class UserData {
  String? name;
  String? mobile;
  String? email;

  UserData({this.name,this.mobile,this.email});

  factory UserData.fromJson(Map<dynamic, dynamic> json) {
    return UserData(
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    return data;
  }
}
