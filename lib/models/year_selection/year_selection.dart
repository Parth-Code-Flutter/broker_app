class YearData {
  int? yearVou;
  String? startDt;
  String? endDt;
  String? cmpVou;
  String? cmpCode;

  YearData({this.yearVou, this.startDt, this.endDt, this.cmpVou, this.cmpCode});

  YearData.fromJson(Map<String, dynamic> json) {
    yearVou = json['YearVou'];
    startDt = json['StartDt'];
    endDt = json['EndDt'];
    cmpVou = json['CmpVou'];
    cmpCode = json['CmpCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['YearVou'] = this.yearVou;
    data['StartDt'] = this.startDt;
    data['EndDt'] = this.endDt;
    data['CmpVou'] = this.cmpVou;
    data['CmpCode'] = this.cmpCode;
    return data;
  }
}
