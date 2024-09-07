class LoadingPaymentData {
  String? id;
  String? vNo;
  String? loadVNo;
  String? vouType;
  String? vouTypeTransCode;
  String? date;
  String? loadQty;
  String? truckNo;
  String? amount;
  String? otherAmount;
  String? rate;
  String? billNo;
  String? billDate;
  String? buyerBillName;
  String? buyerCityName;
  String? buyerStateName;
  String? sellerBillName;
  String? sellerCityName;
  String? sellerStateName;
  String? sellerStateName2;
  String? remarks;
  int? buyerId;
  String? buyerName;
  int? sellerId;
  String? sellerName;
  int? contractNo;
  String? contractDate;
  String? saudaQty;
  String? pendingQty;
  String? loadBags;
  String? saudaBags;
  String? loadPacking;
  String? saudaPackaging;
  String? payAmount;
  String? payCharges;
  String? productName;
  String? payBillAmount;

  LoadingPaymentData({
    this.id,
    this.vNo,
    this.loadVNo,
    this.vouType,
    this.vouTypeTransCode,
    this.date,
    this.loadQty,
    this.truckNo,
    this.amount,
    this.otherAmount,
    this.rate,
    this.billNo,
    this.billDate,
    this.buyerBillName,
    this.buyerCityName,
    this.buyerStateName,
    this.sellerBillName,
    this.sellerCityName,
    this.sellerStateName,
    this.sellerStateName2,
    this.remarks,
    this.buyerId,
    this.buyerName,
    this.sellerId,
    this.sellerName,
    this.contractNo,
    this.contractDate,
    this.saudaQty,
    this.pendingQty,
    this.loadBags,
    this.saudaBags,
    this.loadPacking,
    this.saudaPackaging,
    this.payAmount,
    this.payCharges,
    this.productName,
    this.payBillAmount,
  });

  LoadingPaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vNo = json['vNo'];
    loadVNo = json['loadVNo'].toString();
    vouType = json['vouType'];
    vouTypeTransCode = json['vouTypeTransCode'];
    date = json['date'];
    loadQty = json['loadQty'].toString();
    truckNo = json['truckNo'];
    amount = json['amount'].toString();
    otherAmount = json['otherAmount'].toString();
    rate = json['rate'].toString();
    billNo = json['billNo'];
    billDate = json['billDate'];
    buyerBillName = json['buyerBillName'];
    buyerCityName = json['buyerCityName'];
    buyerStateName = json['buyerStateName'];
    sellerBillName = json['sellerBillName'];
    sellerCityName = json['sellerCityName'];
    sellerStateName = json['sellerStateName'];
    sellerStateName2 = json['sellerStateName2'];
    remarks = json['remarks'];
    buyerId = json['buyerId'];
    buyerName = json['buyerName'];
    sellerId = json['sellerId'];
    sellerName = json['sellerName'];
    contractNo = json['contractNo'];
    contractDate = json['contractDate'];
    saudaQty = json['saudaQty'].toString();
    pendingQty = json['pendingQty'].toString();
    loadBags = json['loadBags'].toString();
    saudaBags = json['saudaBags'].toString();
    loadPacking = json['loadPacking'].toString();
    saudaPackaging = json['saudaPackaging'].toString();
    payAmount = json['payAmount'].toString();
    payCharges = json['payCharges'].toString();
    productName = json['productName'].toString();
    payBillAmount = json['payBillAmount'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vNo'] = this.vNo;
    data['loadVNo'] = this.loadVNo;
    data['vouType'] = this.vouType;
    data['vouTypeTransCode'] = this.vouTypeTransCode;
    data['date'] = this.date;
    data['loadQty'] = this.loadQty;
    data['truckNo'] = this.truckNo;
    data['amount'] = this.amount;
    data['otherAmount'] = this.otherAmount;
    data['rate'] = this.rate;
    data['billNo'] = this.billNo;
    data['billDate'] = this.billDate;
    data['buyerBillName'] = this.buyerBillName;
    data['buyerCityName'] = this.buyerCityName;
    data['buyerStateName'] = this.buyerStateName;
    data['sellerBillName'] = this.sellerBillName;
    data['sellerCityName'] = this.sellerCityName;
    data['sellerStateName'] = this.sellerStateName;
    data['sellerStateName2'] = this.sellerStateName2;
    data['remarks'] = this.remarks;
    data['buyerId'] = this.buyerId;
    data['buyerName'] = this.buyerName;
    data['sellerId'] = this.sellerId;
    data['sellerName'] = this.sellerName;
    data['contractNo'] = this.contractNo;
    data['contractDate'] = this.contractDate;
    data['saudaQty'] = this.saudaQty;
    data['pendingQty'] = this.pendingQty;
    data['loadBags'] = this.loadBags;
    data['saudaBags'] = this.saudaBags;
    data['loadPacking'] = this.loadPacking;
    data['saudaPackaging'] = this.saudaPackaging;
    data['payAmount'] = this.payAmount;
    data['payCharges'] = this.payCharges;
    data['productName'] = this.productName;
    data['payBillAmount'] = this.payBillAmount;
    return data;
  }
}
