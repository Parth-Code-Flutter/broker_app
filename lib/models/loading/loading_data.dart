class LoadingData {
  int id;
  int vNo;
  String vouType;
  String vouTypeTransCode;
  String date;
  String loadQty;
  String truckNo;
  String amount;
  int otherAmount;
  String rate;
  String billNo;
  String billDate;
  String buyerBillName;
  String buyerCityName;
  String buyerStateName;
  String buyerStateName2;
  String sellerBillName;
  String sellerCityName;
  String sellerStateName;
  String sellerStateName2;
  String remarks;
  int buyerId;
  String buyerName;
  int sellerId;
  String sellerName;
  int contractNo;
  String contractDate;
  String saudaQty;
  String pendingQty;
  String loadBags;
  String saudaBags;
  String loadPacking;
  String saudaPackaging;
  String productName;

  LoadingData({
    required this.id,
    required this.vNo,
    required this.vouType,
    required this.vouTypeTransCode,
    required this.date,
    required this.loadQty,
    required this.truckNo,
    required this.amount,
    required this.otherAmount,
    required this.rate,
    required this.billNo,
    required this.billDate,
    required this.buyerBillName,
    required this.buyerCityName,
    required this.buyerStateName,
    required this.buyerStateName2,
    required this.sellerBillName,
    required this.sellerCityName,
    required this.sellerStateName,
    required this.sellerStateName2,
    required this.remarks,
    required this.buyerId,
    required this.buyerName,
    required this.sellerId,
    required this.sellerName,
    required this.contractNo,
    required this.contractDate,
    required this.saudaQty,
    required this.pendingQty,
    required this.loadBags,
    required this.saudaBags,
    required this.loadPacking,
    required this.saudaPackaging,
    required this.productName,
  });

  factory LoadingData.fromJson(Map<dynamic, dynamic> json) {
    return LoadingData(
      id: json['id'],
      vNo: json['vNo'],
      vouType: json['vouType'],
      vouTypeTransCode: json['vouTypeTransCode'],
      date: json['date'],
      loadQty: json['loadQty'].toStringAsFixed(2),
      truckNo: json['truckNo'],
      amount: json['amount'].toString(),
      otherAmount: json['otherAmount'],
      rate: json['rate'].toString(),
      billNo: json['billNo'],
      billDate: json['billDate'],
      buyerBillName: json['buyerBillName'],
      buyerCityName: json['buyerCityName'],
      buyerStateName: json['buyerStateName'],
      buyerStateName2: json['buyerStateName2'],
      sellerBillName: json['sellerBillName'],
      sellerCityName: json['sellerCityName'],
      sellerStateName: json['sellerStateName'],
      sellerStateName2: json['sellerStateName2'],
      remarks: json['remarks'],
      buyerId: json['buyerId'],
      buyerName: json['buyerName'],
      sellerId: json['sellerId'],
      sellerName: json['sellerName'],
      contractNo: json['contractNo'],
      contractDate: json['contractDate'],
      saudaQty: json['saudaQty'].toString(),
      pendingQty: json['pendingQty'].toString(),
      loadBags: json['loadBags'].toString(),
      saudaBags: json['saudaBags'].toString(),
      loadPacking: json['loadPacking'].toString(),
      saudaPackaging: json['saudaPackaging'].toString(),
      productName: json['productName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vNo'] = this.vNo;
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
    data['buyerStateName2'] = this.buyerStateName2;
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
    data['productName'] = this.productName;
    return data;
  }
}
