class VillageData {
  String id;
  String name;

  VillageData({required this.id, required this.name});

  factory VillageData.fromJson(Map<dynamic, dynamic> json) {
    return VillageData(id: json['VillageId'], name: json['Village']);
  }
}
