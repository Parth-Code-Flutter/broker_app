class AddCollectionData {
  String? companyId;
  String? customerId;
  String? collectionTypeId;
  String? chequeNumber;
  String? chequeDate;
  double? amount;
  String? remarks;
  bool? isVisitor;
  double? lat;
  double? lng;
  String? date;

  AddCollectionData(
      {this.companyId,
      this.customerId,
      this.collectionTypeId,
      this.chequeNumber,
      this.chequeDate,
      this.amount,
      this.remarks,
      this.isVisitor,
      this.lat,
      this.lng,
      this.date});

  AddCollectionData.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    customerId = json['customerId'];
    collectionTypeId = json['collectionTypeId'];
    chequeNumber = json['chequeNumber'];
    chequeDate = json['chequeDate'];
    amount = json['amount'];
    remarks = json['remarks'];
    isVisitor = json['isVisitor'];
    lat = json['lat'];
    lng = json['lng'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['customerId'] = this.customerId;
    if (collectionTypeId != null)
      data['collectionTypeId'] = this.collectionTypeId;
    if (chequeNumber != null) data['chequeNumber'] = this.chequeNumber;
    if (chequeDate != null) data['chequeDate'] = this.chequeDate;
    if (amount != null) data['amount'] = this.amount;
    data['remarks'] = this.remarks;
    data['isVisitor'] = this.isVisitor;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['date'] = this.date;
    return data;
  }
}
