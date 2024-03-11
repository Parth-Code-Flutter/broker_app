class ProductCatData {
  String id;
  String name;

  ProductCatData({
    required this.id,
    required this.name,
  });

  factory ProductCatData.fromJson(Map<dynamic, dynamic> json) {
    return ProductCatData(
      id: json['ProductCategoryId'],
      name: json['ProductCategory'],
    );
  }
}
