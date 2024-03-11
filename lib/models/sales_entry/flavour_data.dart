class FlavourData {
  String id;
  String name;

  FlavourData({
    required this.id,
    required this.name,
  });

  factory FlavourData.fromJson(Map<dynamic, dynamic> json) {
    return FlavourData(
      id: json['FlavourId'],
      name: json['Flavour'],
    );
  }
}
