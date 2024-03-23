class BrokerInvoiceData {
  String? invVou;
  String? invVNo;
  String? invType;
  String? invTotal;
  int? invSaudaTotal;
  String? invDate;
  String? invVtyVou;
  String? invFileNm;
  String? invFromDate;
  String? invToDate;
  String? invAccVou;
  String? accNm;
  String? ctyNm;

  BrokerInvoiceData(
      {this.invVou,
      this.invVNo,
      this.invType,
      this.invTotal,
      this.invSaudaTotal,
      this.invDate,
      this.invVtyVou,
      this.invFileNm,
      this.invFromDate,
      this.invToDate,
      this.invAccVou,
      this.accNm,
      this.ctyNm});

  factory BrokerInvoiceData.fromJson(Map<dynamic, dynamic> json) {
    return BrokerInvoiceData(
      invVou: json['InvVou'],
      invVNo: json['InvVNo'],
      invType: json['InvType'],
      invTotal: json['InvTotal'].toString(),
      invSaudaTotal: json['InvSaudaTotal'],
      invDate: json['InvDate'],
      invVtyVou: json['InvVtyVou'],
      invFileNm: json['InvFileNm'],
      invFromDate: json['InvFromDate'],
      invToDate: json['InvToDate'],
      invAccVou: json['InvAccVou'],
      accNm: json['AccNm'],
      ctyNm: json['CtyNm'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['InvVou'] = this.invVou;
    data['InvVNo'] = this.invVNo;
    data['InvType'] = this.invType;
    data['InvTotal'] = this.invTotal;
    data['InvSaudaTotal'] = this.invSaudaTotal;
    data['InvDate'] = this.invDate;
    data['InvVtyVou'] = this.invVtyVou;
    data['InvFileNm'] = this.invFileNm;
    data['InvFromDate'] = this.invFromDate;
    data['InvToDate'] = this.invToDate;
    data['InvAccVou'] = this.invAccVou;
    data['AccNm'] = this.accNm;
    data['CtyNm'] = this.ctyNm;
    return data;
  }
}
