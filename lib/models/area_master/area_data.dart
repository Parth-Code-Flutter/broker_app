class AreaData {
  String id;
  String name;

  AreaData({required this.id, required this.name});

  factory AreaData.fromJson(Map<dynamic, dynamic> json) {
    return AreaData(id: json['AreaId'], name: json['Area']);
  }
}
