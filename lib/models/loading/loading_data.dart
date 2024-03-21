class LoadingData {
  int id;
  int vNo;
  String date;
  String loadQty;
  String truckNo;
  String amount;
  int otherAmount;
  int rate;
  String billNo;
  String billDate;
  String buyerBillName;
  String sellerBillName;
  String remarks;
  int buyerId;
  String buyerName;
  int sellerId;
  String sellerName;
  int contractNo;
  String contractDate;
  int saudaQty;
  String pendingQty;

  LoadingData(
      {required this.id,
      required this.vNo,
      required this.date,
      required this.loadQty,
      required this.truckNo,
      required this.amount,
      required this.otherAmount,
      required this.rate,
      required this.billNo,
      required this.billDate,
      required this.buyerBillName,
      required this.sellerBillName,
      required this.remarks,
      required this.buyerId,
      required this.buyerName,
      required this.sellerId,
      required this.sellerName,
      required this.contractNo,
      required this.contractDate,
      required this.saudaQty,
      required this.pendingQty});

  factory LoadingData.fromJson(Map<dynamic, dynamic> json) {
    return LoadingData(
      id: json['id'],
      vNo: json['vNo'],
      date: json['date'],
      loadQty: json['loadQty'].toString(),
      truckNo: json['truckNo'],
      amount: json['amount'].toString(),
      otherAmount: json['otherAmount'],
      rate: json['rate'],
      billNo: json['billNo'],
      billDate: json['billDate'],
      buyerBillName: json['buyerBillName'],
      sellerBillName: json['sellerBillName'],
      remarks: json['remarks'],
      buyerId: json['buyerId'],
      buyerName: json['buyerName'],
      sellerId: json['sellerId'],
      sellerName: json['sellerName'],
      contractNo: json['contractNo'],
      contractDate: json['contractDate'],
      saudaQty: json['saudaQty'],
      pendingQty: json['pendingQty'].toString(),
    );
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
