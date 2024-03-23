class CloudFunctionsNames {
  static String get host => 'https://brokerapi.pioerp.com/';
  static String get prefix => 'apis';

  static String get auth => 'auth';
  static String get login => '$prefix/$auth/login';
  static String get forgotPass => '$prefix/$auth/forgotPass';
  static String get verifyOtp => '$prefix/$auth/verifyOtp';
  static String get resetPass => '$prefix/$auth/resetPass';
  static String get verifyPin => '$prefix/$auth/verifyPin';
  static String get resetPin => '$prefix/$auth/resetPin';
  static String get getYears => '$prefix/$auth/getYears';

  static String get products => 'products';
  static String get getProducts => '$prefix/$products/get';

  // static String get profile => 'profile';
  static String get getProfile => '$prefix/$auth/getUser';
  static String get getSplash => '$prefix/$auth/getSplash';


  static String get parties => 'parties';
  static String get getParties => '$prefix/$parties/get';

  static String get voucherTypes => 'voucherTypes';
  static String get getVoucherTypes => '$prefix/$voucherTypes/get';


  static String get contracts => 'contracts';
  static String get getContracts => '$prefix/$contracts/get';

  static String get loadings => 'loadings';
  static String get getLoadings => '$prefix/$loadings/get';

  static String get loadingPayments => 'loadingPayments';
  static String get getLoadingPayments => '$prefix/$loadingPayments/get';

  static String get categories => 'categories';
  static String get getCategories => '$prefix/$categories/get';

  static String get flavours => 'flavours';
  static String get getFlavours => '$prefix/$flavours/get';

  static String get sales => 'sales';
  static String get addSales => '$prefix/$sales/add';
}
