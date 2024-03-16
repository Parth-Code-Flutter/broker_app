class PartyMasterData {
  String? accVou;
  int? accCmpVou;
  String? accNm;
  String? accCtyName;
  String? accState;
  String? accPhone;
  String? accMob;
  String? accEml;
  String? accPAN;
  String? accGST;
  String? accAdd;

  PartyMasterData(
      {this.accVou,
        this.accCmpVou,
        this.accNm,
        this.accCtyName,
        this.accState,
        this.accPhone,
        this.accMob,
        this.accEml,
        this.accPAN,
        this.accGST,
        this.accAdd});

  PartyMasterData.fromJson(Map<String, dynamic> json) {
    accVou = json['AccVou'];
    accCmpVou = json['AccCmpVou'];
    accNm = json['AccNm'];
    accCtyName = json['AccCtyName'];
    accState = json['AccState'];
    accPhone = json['AccPhone'];
    accMob = json['AccMob'];
    accEml = json['AccEml'];
    accPAN = json['AccPAN'];
    accGST = json['AccGST'];
    accAdd = json['AccAdd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccVou'] = this.accVou;
    data['AccCmpVou'] = this.accCmpVou;
    data['AccNm'] = this.accNm;
    data['AccCtyName'] = this.accCtyName;
    data['AccState'] = this.accState;
    data['AccPhone'] = this.accPhone;
    data['AccMob'] = this.accMob;
    data['AccEml'] = this.accEml;
    data['AccPAN'] = this.accPAN;
    data['AccGST'] = this.accGST;
    data['AccAdd'] = this.accAdd;
    return data;
  }
}
