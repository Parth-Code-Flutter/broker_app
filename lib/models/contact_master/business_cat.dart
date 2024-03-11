class BusinessCat {
  String id;
  String name;

  BusinessCat({required this.id, required this.name});

  factory BusinessCat.fromJson(Map<dynamic, dynamic> json) {
    return BusinessCat(id: json['id'], name: json['catType']);
  }

  static List<BusinessCat> businessCat = [
    BusinessCat(id: '1', name: 'Pan Parlour'),
    BusinessCat(id: '2', name: 'Ice Cream Parlour'),
    BusinessCat(id: '3', name: 'Hotel'),
    BusinessCat(id: '4', name: 'Restaurant'),
    BusinessCat(id: '5', name: 'Kirana'),
    BusinessCat(id: '6', name: 'Dairy'),
    BusinessCat(id: '7', name: 'Bakery'),
    BusinessCat(id: '8', name: 'Super Market'),
    BusinessCat(id: '9', name: 'Mall'),
    BusinessCat(id: '10', name: 'Tea Stall'),
    BusinessCat(id: '11', name: 'Provision Stall'),
    BusinessCat(id: '12', name: 'Medical Store'),
    BusinessCat(id: '13', name: 'Sweet Mart'),
  ];
}
