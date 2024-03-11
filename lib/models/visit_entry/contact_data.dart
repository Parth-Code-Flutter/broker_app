class ContactData {
  String id;
  String name;

  ContactData({required this.id, required this.name});

  factory ContactData.fromJson(Map<dynamic, dynamic> json) {
    return ContactData(id: json['ContactId'], name: json['CustomerName']);
  }
}
