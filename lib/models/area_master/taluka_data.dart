class TalukaData {
  String id;
  String name;

  TalukaData({required this.id, required this.name});

  factory TalukaData.fromJson(Map<dynamic, dynamic> json) {
    return TalukaData(id: json['TalukaId'], name: json['Taluka']);
  }
}
