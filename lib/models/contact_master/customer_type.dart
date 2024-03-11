class CustomerType {
  String id;
  String name;

  CustomerType({required this.id, required this.name});

  factory CustomerType.fromJson(Map<dynamic, dynamic> json) {
    return CustomerType(id: json['id'], name: json['custType']);
  }

  static List<CustomerType> businessCat = [
    CustomerType(id: '1', name: 'Consumer'),
    CustomerType(id: '2', name: 'Retailer'),
    CustomerType(id: '3', name: 'Distributor'),
    CustomerType(id: '4', name: 'Super Stocklist'),
    CustomerType(id: '5', name: 'Other'),
  ];
}
