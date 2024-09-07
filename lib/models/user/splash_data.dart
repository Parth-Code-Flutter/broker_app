class SplashData {
  String? cliSplashImg;
  String? logo;

  SplashData({this.cliSplashImg, this.logo});

  factory SplashData.fromJson(Map<dynamic, dynamic> json) {
    return SplashData(
      cliSplashImg: json['CliSplashImg'],
      logo: json['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['CliSplashImg'] = this.logo;
    data['logo'] = this.logo;
    return data;
  }
}
