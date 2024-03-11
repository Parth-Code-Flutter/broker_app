import 'dart:convert';

import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/cloud_functions/cloud_function_result.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class CloudFunctionsHelper {
  static Future<Map<String, String>> commonHeaders() async {
    String? getToken = await AppGlobals.instance.token;
    var headers = {
      'content-Type': 'application/json',
      "Authorization": 'Bearer ${getToken ?? ''}'
    };
    return headers;
  }

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static Future<CloudFunctionResult> call({
    required String name,
    required Map<dynamic, dynamic> data,
    Duration? timeout,
  }) async {
    try {
      bool internetConnected = await check();
      if (internetConnected) {
        DevHelper.log(name);
        DevHelper.log(data);

        final result = await callHttp(
          name: name,
          data: data,
        );

        return CloudFunctionResult(
          success: true,
          data: result.data as dynamic,
        );
      } else {
        return CloudFunctionResult(
          success: false,
          eCode: '500',
          eMsg: 'Please check your internet connection!',
        );
      }
    } on APIError catch (e) {
      DevHelper.log(e.code);
      DevHelper.log(e.message);
      return CloudFunctionResult(
        success: false,
        eCode: e.code,
        eMsg: e.message,
      );
    } catch (e) {
      DevHelper.log(e);
      return CloudFunctionResult(
        success: false,
        eMsg: e.toString(),
      );
    }
  }

  static Future<CloudFunctionResult> callHttp({
    required String name,
    required Map<dynamic, dynamic> data,
  }) async {
    DevHelper.log(Uri.parse(CloudFunctionsNames.host + name));
    var header = await commonHeaders();
    final response = await http.post(
      Uri.parse(CloudFunctionsNames.host + name),
      body: jsonEncode(data),
      headers: header,
    );

    DevHelper.log(response.body);

    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return CloudFunctionResult(
        success: true,
        data: jsonResponse,
      );
    }

    final code = (jsonResponse as Map)['code'] as String?;
    final message = jsonResponse['message'] as String?;

    throw APIError(
      message: message ?? 'Something went wrong',
      code: code ?? 'unknown',
    );
  }
}

class APIError implements Exception {
  APIError({
    required this.message,
    required this.code,
  });

  String message;
  String code;
}
