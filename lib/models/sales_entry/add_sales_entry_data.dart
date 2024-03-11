class AddSalesEntryData {
  String? companyId;
  String? customerId;
  String? categoryId;
  String? flavourId;
  double? amount;
  List<Products>? products;
  String? collectionType;
  String? remarks;
  double? lat;
  double? lng;

  AddSalesEntryData(
      {this.companyId,
        this.customerId,
        this.categoryId,
        this.flavourId,
        this.amount,
        this.products,
        this.collectionType,
        this.remarks,
        this.lat,
        this.lng});

  AddSalesEntryData.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    customerId = json['customerId'];
    categoryId = json['categoryId'];
    flavourId = json['flavourId'];
    amount = json['amount'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    collectionType = json['collectionType'];
    remarks = json['remarks'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['customerId'] = this.customerId;
    data['categoryId'] = this.categoryId;
    data['flavourId'] = this.flavourId;
    data['amount'] = this.amount;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['collectionType'] = this.collectionType;
    data['remarks'] = this.remarks;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Products {
  String? productId;
  int? rate;
  int? qnty;
  double? amount;

  Products({this.productId, this.rate, this.qnty, this.amount});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    rate = json['rate'];
    qnty = json['qnty'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['rate'] = this.rate;
    data['qnty'] = this.qnty;
    data['amount'] = this.amount;
    return data;
  }
}
