import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/providers/location/app_location_provider.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:provider/provider.dart';

class APIUrls {
  static const baseUrl = 'https://brokerapi.pioerp.com';

  static String get userId => AppGlobals.instance.userId!;

  static String get companyId => AppGlobals.instance.companyId!;

  static double? get lat =>
      NavHelper.globalContext.read<AppLocationProvider>().appLocation?.lat;

  static double? get lng =>
      NavHelper.globalContext.read<AppLocationProvider>().appLocation?.lng;

  static String get contactMaster =>
      '$baseUrl/contactmaster/index?UserId=$userId&CompanyId=$companyId&Lat=$lat&Lng=$lng';

  static String get collectionMaster =>
      '$baseUrl/collection/index?UserId=$userId&CompanyId=$companyId&Lat=$lat&Lng=$lng';

  static String get salesEntry =>
      '$baseUrl/sales/index?UserId=$userId&CompanyId=$companyId&Lat=$lat&Lng=$lng';

  static String get splashScreenUrl =>
      'http://broker.pioerp.com/SplashImg/';
}
