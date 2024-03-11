class CollectionType {
  String id;
  String name;

  CollectionType({required this.id, required this.name});

  factory CollectionType.fromJson(Map<dynamic, dynamic> json) {
    return CollectionType(id: json['id'], name: json['amount']);
  }

  static List<CollectionType> collectionType = [
    CollectionType(id: '1', name: 'Cash'),
    CollectionType(id: '2', name: 'Bank'),
  ];
}
