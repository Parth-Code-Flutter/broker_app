class DistrictData {
  String id;
  String name;

  DistrictData({required this.id, required this.name});

  factory DistrictData.fromJson(Map<dynamic, dynamic> json) {
    return DistrictData(id: json['DistrictId'], name: json['District']);
  }
}
