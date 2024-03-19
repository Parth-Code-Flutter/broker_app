class ContractsData {
  int? contractMasterId;
  int? contractId;
  String? qty;
  String? packaging;
  String? saudaRate;
  int? buyerId;
  int? sellerId;
  String? buyerName;
  String? sellerName;
  int? productId;
  String? productName;
  String? date;
  int? vouTypeVou;
  String? vouType;
  String? vouTypeTransCode;

  ContractsData({
    this.contractMasterId,
    this.contractId,
    this.qty,
    this.packaging,
    this.saudaRate,
    this.buyerId,
    this.sellerId,
    this.buyerName,
    this.sellerName,
    this.productId,
    this.productName,
    this.date,
    this.vouTypeVou,
    this.vouType,
    this.vouTypeTransCode,
  });

  ContractsData.fromJson(Map<String, dynamic> json) {
    contractMasterId = json['contractMasterId'];
    contractId = json['contractId'];
    qty = json['qty'].toString();
    packaging = json['packaging'];
    saudaRate = json['saudaRate'].toString();
    buyerId = json['buyerId'];
    sellerId = json['sellerId'];
    buyerName = json['buyerName'];
    sellerName = json['sellerName'];
    productId = json['productId'];
    productName = json['productName'];
    date = json['date'];
    vouTypeVou = json['vouTypeVou'];
    vouType = json['vouType'];
    vouTypeTransCode = json['vouTypeTransCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contractMasterId'] = this.contractMasterId;
    data['contractId'] = this.contractId;
    data['qty'] = this.qty;
    data['packaging'] = this.packaging;
    data['saudaRate'] = this.saudaRate;
    data['buyerId'] = this.buyerId;
    data['sellerId'] = this.sellerId;
    data['buyerName'] = this.buyerName;
    data['sellerName'] = this.sellerName;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['date'] = this.date;
    data['vouTypeVou'] = this.vouTypeVou;
    data['vouType'] = this.vouType;
    data['vouTypeTransCode'] = this.vouTypeTransCode;
    return data;
  }
}
