class StateData {
  String id;
  String name;

  StateData({required this.id, required this.name});

  factory StateData.fromJson(Map<dynamic, dynamic> json) {
    return StateData(id: json['StateId'], name: json['State']);
  }
}
