class LoadingPaymentData {
  String? id;
  String? vNo;
  String? date;
  String? loadQty;
  String? truckNo;
  String? amount;
  String? otherAmount;
  String? rate;
  String? billNo;
  String? billDate;
  String? buyerBillName;
  String? sellerBillName;
  String? remarks;
  int? buyerId;
  String? buyerName;
  int? sellerId;
  String? sellerName;
  int? contractNo;
  String? contractDate;
  String? saudaQty;
  String? pendingQty;

  LoadingPaymentData(
      {this.id,
      this.vNo,
      this.date,
      this.loadQty,
      this.truckNo,
      this.amount,
      this.otherAmount,
      this.rate,
      this.billNo,
      this.billDate,
      this.buyerBillName,
      this.sellerBillName,
      this.remarks,
      this.buyerId,
      this.buyerName,
      this.sellerId,
      this.sellerName,
      this.contractNo,
      this.contractDate,
      this.saudaQty,
      this.pendingQty});

  LoadingPaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vNo = json['vNo'];
    date = json['date'];
    loadQty = json['loadQty'].toString();
    truckNo = json['truckNo'];
    amount = json['amount'].toString();
    otherAmount = json['otherAmount'].toString();
    rate = json['rate'].toString();
    billNo = json['billNo'];
    billDate = json['billDate'];
    buyerBillName = json['buyerBillName'];
    sellerBillName = json['sellerBillName'];
    remarks = json['remarks'];
    buyerId = json['buyerId'];
    buyerName = json['buyerName'];
    sellerId = json['sellerId'];
    sellerName = json['sellerName'];
    contractNo = json['contractNo'];
    contractDate = json['contractDate'];
    saudaQty = json['saudaQty'].toString();
    pendingQty = json['pendingQty'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vNo'] = this.vNo;
    data['date'] = this.date;
    data['loadQty'] = this.loadQty;
    data['truckNo'] = this.truckNo;
    data['amount'] = this.amount;
    data['otherAmount'] = this.otherAmount;
    data['rate'] = this.rate;
    data['billNo'] = this.billNo;
    data['billDate'] = this.billDate;
    data['buyerBillName'] = this.buyerBillName;
    data['sellerBillName'] = this.sellerBillName;
    data['remarks'] = this.remarks;
    data['buyerId'] = this.buyerId;
    data['buyerName'] = this.buyerName;
    data['sellerId'] = this.sellerId;
    data['sellerName'] = this.sellerName;
    data['contractNo'] = this.contractNo;
    data['contractDate'] = this.contractDate;
    data['saudaQty'] = this.saudaQty;
    data['pendingQty'] = this.pendingQty;
    return data;
  }
}
