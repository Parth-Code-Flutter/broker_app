// ignore_for_file: avoid_positional_boolean_parameters

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const _isAuthenticatedKey = 'isAuthenticated';
  static const _userId = 'userId';
  static const _token = 'token';
  static const _hasPin = 'hasPin';
  static const _companyId = 'companyId';

  static Future<SharedPreferences> get _preferences =>
      SharedPreferences.getInstance();

  static Future<void> setIsAuthenticated(bool value) async {
    final preferences = await _preferences;

    await preferences.setBool(_isAuthenticatedKey, value);
  }

  static Future<bool> get isAuthenticated async {
    final preferences = await _preferences;

    return preferences.getBool(_isAuthenticatedKey) ?? false;
  }

  static Future<void> setHasPin(bool value) async {
    final preferences = await _preferences;

    await preferences.setBool(_hasPin, value);
  }

  static Future<bool> get hasPin async {
    final preferences = await _preferences;

    return preferences.getBool(_hasPin) ?? false;
  }

  static Future<void> setUserId(String value) async {
    final preferences = await _preferences;

    await preferences.setString(_userId, value);
  }

  static Future<String?> get userId async {
    final preferences = await _preferences;

    return preferences.getString(_userId);
  }

  static Future<void> setCompanyId(String value) async {
    final preferences = await _preferences;

    await preferences.setString(_companyId, value);
  }

  static Future<String?> get companyId async {
    final preferences = await _preferences;

    return preferences.getString(_companyId);
  }

  static Future<void> setToken(String value) async {
    final preferences = await _preferences;

    await preferences.setString(_token, value);
  }

  static Future<String?> get token async {
    final preferences = await _preferences;

    return preferences.getString(_token);
  }

  static Future<void> clear() async {
    final preferences = await _preferences;

    await preferences.clear();
  }
}
