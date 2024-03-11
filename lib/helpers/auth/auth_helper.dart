import 'package:broker_app/helpers/cloud_functions/cloud_functions_helper.dart';
import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/helpers/local_storage/shared_prefs_helper.dart';
import 'package:broker_app/models/api/api_result.dart';
import 'package:broker_app/models/cloud_functions/cloud_function_result.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthHelper {
  static Future<String?> login({
    required String phone,
    required String pass,
  }) async {
    try {
      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.login,
        data: {
          'phone': phone,
          'password': pass,
          'deviceToken': 'ok',
        },
      );

      if (!result.success || result.data == null) return result.eMsg;

      await SharedPrefsHelper.setIsAuthenticated(true);

      final token = (result.data! as Map<String, dynamic>)['token'] as String;

      final hasPin =
          (result.data! as Map<String, dynamic>)['hasPin'] as bool? ?? false;

      final companyId =
          (result.data! as Map<String, dynamic>)['companyId']?.toString() ?? '';

      await SharedPrefsHelper.setToken(token);

      await SharedPrefsHelper.setHasPin(hasPin);

      await SharedPrefsHelper.setCompanyId(companyId);

      AppGlobals.instance.token = token;

      AppGlobals.instance.hasPin = hasPin;

      AppGlobals.instance.companyId = companyId;

      final decodedToken = JwtDecoder.decode(token);

      AppGlobals.instance.userId = decodedToken['userId']?.toString();

      return null;
    } catch (e) {
      DevHelper.log(e);
      return AppStrings.eSomethingWrong;
    }
  }

  static Future<String?> forgotPass({
    required String phone,
  }) async {
    try {
      // final body = {
      //   'Mobile': phone,
      // };

      // final result = await APIHelper.callPostAPI(
      //   name: APIUrls.forgotPassword,
      //   body: body,
      // );

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.forgotPass,
        data: {
          'phone': phone,
        },
      );

      if (!result.success) return result.eMsg;

      return null;
    } catch (e) {
      return AppStrings.eSomethingWrong;
    }
  }

  static Future<CloudFunctionResult> verifyOtp({
    required String phone,
    required String otp,
    required bool forPass,
  }) async {
    try {
      // final body = {
      //   'Mobile': phone,
      //   'OTP': otp,
      // };

      // final result = await APIHelper.callPostAPI(
      //   name: APIUrls.validateOtp,
      //   body: body,
      // );

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.verifyOtp,
        data: {
          'phone': phone,
          'otp': otp,
          'forPass': forPass,
        },
      );

      return result;
    } catch (e) {
      return CloudFunctionResult(
        success: false,
        eMsg: AppStrings.eSomethingWrong,
      );
    }
  }

  static Future<CloudFunctionResult> verifyPin({
    required String pin,
  }) async {
    try {
      // final body = {
      //   'Mobile': phone,
      //   'OTP': otp,
      // };

      // final result = await APIHelper.callPostAPI(
      //   name: APIUrls.validateOtp,
      //   body: body,
      // );

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.verifyPin,
        data: {
          'token': AppGlobals.instance.token,
          'pin': pin,
        },
      );

      return result;
    } catch (e) {
      return CloudFunctionResult(
        success: false,
        eMsg: AppStrings.eSomethingWrong,
      );
    }
  }

  static Future<String?> resendOtp({
    required String phone,
  }) async {
    try {
      // final body = {
      //   'Mobile': phone,
      // };

      // final result = await APIHelper.callPostAPI(
      //   name: APIUrls.resendOtp,
      //   body: body,
      // );

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.forgotPass,
        data: {
          'phone': phone,
        },
      );

      if (!result.success) return result.eMsg;

      return null;
    } catch (e) {
      return AppStrings.eSomethingWrong;
    }
  }

  static Future<String?> changePass({
    required String phone,
    required String oldPass,
    required String pass,
  }) async {
    try {
      // final body = {
      //   'Mobile': phone,
      //   'NewPassword': pass,
      // };

      // final result = await APIHelper.callPostAPI(
      //   name: APIUrls.updateNewPassword,
      //   body: body,
      // );

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.resetPass,
        data: {
          'phone': phone,
          'oldPass': oldPass,
          'newPass': pass,
        },
      );

      if (!result.success) return result.eMsg;

      return null;
    } catch (e) {
      DevHelper.log(e);
      return AppStrings.eSomethingWrong;
    }
  }

  static Future<String?> changePin({
    required String? oldPin,
    required String pin,
  }) async {
    try {
      // final body = {
      //   'Mobile': phone,
      //   'NewPassword': pass,
      // };

      // final result = await APIHelper.callPostAPI(
      //   name: APIUrls.updateNewPassword,
      //   body: body,
      // );

      final body = {
        'token': AppGlobals.instance.token,
        if (oldPin != null) 'oldPin': oldPin,
        // 'oldPin': '123456',
        'newPin': pin,
      };

      DevHelper.log(body);

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.resetPin,
        data: body,
      );

      if (!result.success) return result.eMsg;

      return null;
    } catch (e) {
      DevHelper.log(e);
      return AppStrings.eSomethingWrong;
    }
  }

  static Future<String?> changePassWithOldPass({
    required String phone,
    required String oldPass,
    required String pass,
  }) async {
    try {
      // final body = {
      //   'Mobile': phone,
      //   'OldPassword': oldPass,
      //   'NewPassword': pass,
      // };

      // final result = await APIHelper.callPostAPI(
      //   name: APIUrls.updatePassword,
      //   body: body,
      // );

      final result = APIResult(
        success: true,
      );

      if (!result.success) return result.message;

      return null;
    } catch (e) {
      DevHelper.log(e);
      return AppStrings.eSomethingWrong;
    }
  }

  static Future<bool> logout(BuildContext context) async {
    try {
      AppProvider.cleanAllData(context);

      await SharedPrefsHelper.clear();

      return true;
    } catch (e) {
      DevHelper.log(e);
      return false;
    }
  }
}
