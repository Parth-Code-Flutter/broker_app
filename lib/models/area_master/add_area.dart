class AddArea {
  String? companyId;
  String? area;
  String? pinCode;
  String? stateId;
  String? districtId;
  String? talukaId;
  String? villageId;
  double? lat;
  double? lng;

  AddArea(
      {this.companyId,
        this.area,
        this.pinCode,
        this.stateId,
        this.districtId,
        this.talukaId,
        this.villageId,
        this.lat,
        this.lng});

  AddArea.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    area = json['area'];
    pinCode = json['pinCode'];
    stateId = json['stateId'];
    districtId = json['districtId'];
    talukaId = json['talukaId'];
    villageId = json['villageId'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['area'] = this.area;
    data['pinCode'] = this.pinCode;
    data['stateId'] = this.stateId;
    data['districtId'] = this.districtId;
    data['talukaId'] = this.talukaId;
    data['villageId'] = this.villageId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}
