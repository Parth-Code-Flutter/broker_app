class AddContact {
  String? companyId;
  String? businessCategory;
  String? customerType;
  String? companyName;
  String? pinCode;
  String? address;
  String? districtId;
  String? talukaId;
  String? villageId;
  String? areaId;
  String? stateId;
  Contact1? contact1;
  String? email;
  String? website;
  String? gstin;
  String? pan;
  String? aadhar;
  double? lat;
  double? lng;

  AddContact(
      {this.companyId,
        this.businessCategory,
        this.customerType,
        this.companyName,
        this.pinCode,
        this.address,
        this.districtId,
        this.talukaId,
        this.villageId,
        this.areaId,
        this.stateId,
        this.contact1,
        this.email,
        this.website,
        this.gstin,
        this.pan,
        this.aadhar,
        this.lat,
        this.lng});

  AddContact.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    businessCategory = json['businessCategory'];
    customerType = json['customerType'];
    companyName = json['companyName'];
    pinCode = json['pinCode'];
    address = json['address'];
    districtId = json['districtId'];
    talukaId = json['talukaId'];
    villageId = json['villageId'];
    areaId = json['areaId'];
    stateId = json['stateId'];
    contact1 = json['contact1'] != null
        ? new Contact1.fromJson(json['contact1'])
        : null;
    email = json['email'];
    website = json['website'];
    gstin = json['gstin'];
    pan = json['pan'];
    aadhar = json['aadhar'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['businessCategory'] = this.businessCategory;
    data['customerType'] = this.customerType;
    data['companyName'] = this.companyName;
    if (this.pinCode != null) data['pinCode'] = this.pinCode;
    data['address'] = this.address;
    data['districtId'] = this.districtId;
    data['talukaId'] = this.talukaId;
    data['villageId'] = this.villageId;
    data['areaId'] = this.areaId;
    data['stateId'] = this.stateId;
    if (this.contact1 != null) {
      data['contact1'] = this.contact1!.toJson();
    }
    if (this.email != null) data['email'] = this.email;
    if (this.website != null)  data['website'] = this.website;
    if (this.gstin != null) data['gstin'] = this.gstin;
    if (this.pan != null)data['pan'] = this.pan;
    if (this.aadhar != null)data['aadhar'] = this.aadhar;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Contact1 {
  String? name;
  String? mobile1;
  String? mobile2;

  Contact1({this.name, this.mobile1, this.mobile2});

  Contact1.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    return data;
  }
}
