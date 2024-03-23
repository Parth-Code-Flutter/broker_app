class AppGlobals {
  AppGlobals._privateConstructor();

  static final AppGlobals _instance = AppGlobals._privateConstructor();

  /// Gets instance of [AppGlobals]
  static AppGlobals get instance => _instance;

  String? userId;

  String? token;

  bool? hasPin;

  String? userName;

  String? userType;

  String? companyId;
  String? yearId;
  String? selectedYear;
  String? CmpCode;
}
