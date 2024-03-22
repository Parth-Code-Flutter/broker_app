class SplashData {
  String? cliSplashImg;

  SplashData({this.cliSplashImg});

  factory SplashData.fromJson(Map<dynamic, dynamic> json) {
    return SplashData(cliSplashImg: json['CliSplashImg']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['CliSplashImg'] = this.cliSplashImg;
    return data;
  }
}
