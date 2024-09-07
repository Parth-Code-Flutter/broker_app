class ContractsData {
  int? contractMasterId;
  int? contractId;
  int? contractVno;
  String? qty;
  String? bags;
  String? packaging;
  String? saudaRate;
  int? buyerId;
  int? sellerId;
  String? buyerName;
  String? buyerCityName;
  String? buyerStateName;
  String? sellerName;
  String? sellerCityName;
  String? sellerStateName;
  int? productId;
  String? productName;
  String? date;
  int? vouTypeVou;
  String? vouType;
  String? vouTypeTransCode;
  String? buyerRemarks;
  String? sellerRemarks;
  String? fileName;

  ContractsData({
    this.contractMasterId,
    this.contractId,
    this.contractVno,
    this.qty,
    this.bags,
    this.packaging,
    this.saudaRate,
    this.buyerId,
    this.sellerId,
    this.buyerName,
    this.buyerCityName,
    this.buyerStateName,
    this.sellerCityName,
    this.sellerStateName,
    this.sellerName,
    this.productId,
    this.productName,
    this.date,
    this.vouTypeVou,
    this.vouType,
    this.vouTypeTransCode,
    this.buyerRemarks,
    this.sellerRemarks,
    this.fileName,
  });

  ContractsData.fromJson(Map<String, dynamic> json) {
    contractMasterId = json['contractMasterId'];
    contractId = json['contractId'];
    contractVno = json['contractVno'];
    qty = json['qty'].toString();
    bags = json['bags'].toString();
    packaging = json['packaging'];
    saudaRate = json['saudaRate'].toString();
    buyerId = json['buyerId'];
    sellerId = json['sellerId'];
    buyerName = json['buyerName'];
    buyerCityName = json['buyerCityName'];
    buyerStateName = json['buyerStateName'];
    sellerName = json['sellerName'];
    sellerCityName = json['sellerCityName'];
    sellerStateName = json['sellerStateName'];
    productId = json['productId'];
    productName = json['productName'];
    date = json['date'];
    vouTypeVou = json['vouTypeVou'];
    vouType = json['vouType'];
    vouTypeTransCode = json['vouTypeTransCode'];
    buyerRemarks = json['buyerRemarks'];
    sellerRemarks = json['sellerRemarks'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contractMasterId'] = this.contractMasterId;
    data['contractId'] = this.contractId;
    data['contractVno'] = this.contractVno;
    data['qty'] = this.qty;
    data['bags'] = this.bags;
    data['packaging'] = this.packaging;
    data['saudaRate'] = this.saudaRate;
    data['buyerId'] = this.buyerId;
    data['sellerId'] = this.sellerId;
    data['buyerName'] = this.buyerName;
    data['buyerCityName'] = this.buyerCityName;
    data['buyerStateName'] = this.buyerStateName;
    data['sellerName'] = this.sellerName;
    data['sellerCityName'] = this.sellerCityName;
    data['sellerStateName'] = this.sellerStateName;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['date'] = this.date;
    data['vouTypeVou'] = this.vouTypeVou;
    data['vouType'] = this.vouType;
    data['vouTypeTransCode'] = this.vouTypeTransCode;
    data['buyerRemarks'] = this.buyerRemarks;
    data['sellerRemarks'] = this.sellerRemarks;
    data['fileName'] = this.fileName;
    return data;
  }
}
