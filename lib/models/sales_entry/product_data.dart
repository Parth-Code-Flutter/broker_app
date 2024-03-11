class ProductData {
  String id;
  String name;

  int packingQty;
  double amount;
  int qty;

  ProductData({
    required this.id,
    required this.name,
    required this.packingQty,
    required this.amount,
    required this.qty,
  });

  factory ProductData.fromJson(Map<dynamic, dynamic> json) {
    return ProductData(
      id: json['ProductMasterId'],
      name: json['ProductName'],
      packingQty: json['PackingQty'],
      amount: double.parse(json['MRP'].toString()),
      qty: json['qty'] = 1,
    );
  }
}
