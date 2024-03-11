import 'dart:convert';

import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/api/api_result.dart';
import 'package:broker_app/utils/urls/api_urls.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static Future<APIResult> callPostAPI({
    required String name,
    Map<String, String>? params,
    Map<String, dynamic>? body,
  }) async {
    try {
      final urlBuffer = StringBuffer()
        ..write(APIUrls.baseUrl)
        ..write(name);

      if (params != null) {
        urlBuffer.write('?');

        for (var i = 0; i < params.length; i++) {
          final param = params.entries.elementAt(i);

          urlBuffer.write('${param.key}=${param.value}');

          if (i < params.length - 1) {
            urlBuffer.write('&');
          }
        }
      }

      final url = Uri.parse(urlBuffer.toString());

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      final statusCode = jsonResponse['response_code'];

      final data = jsonResponse['response_data'];
      final message = jsonResponse['response_message'] as String?;

      return APIResult(
        success: statusCode == 1,
        message: message,
        data: data,
      );
    } catch (e) {
      DevHelper.log(e.toString());
      return APIResult(
        success: false,
        message: e.toString(),
      );
    }
  }

  static Future<APIResult> callGetAPI({
    required String name,
    Map<String, String>? params,
  }) async {
    try {
      final urlBuffer = StringBuffer()
        ..write(APIUrls.baseUrl)
        ..write(name);

      if (params != null) {
        urlBuffer.write('?');

        for (var i = 0; i < params.length; i++) {
          final param = params.entries.elementAt(i);

          urlBuffer.write('${param.key}=${param.value}');

          if (i < params.length - 1) {
            urlBuffer.write('&');
          }
        }
      }

      final url = Uri.parse(urlBuffer.toString());

      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      DevHelper.log(url);

      final response = await http.get(
        url,
        headers: headers,
      );

      DevHelper.log(response.body);

      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      final statusCode = jsonResponse['response_code'];

      final data = jsonResponse['response_data'];
      final message = jsonResponse['response_message'] as String?;

      return APIResult(
        success: statusCode == 1,
        message: message,
        data: data,
      );
    } catch (e) {
      DevHelper.log(e.toString());
      return APIResult(
        success: false,
        message: e.toString(),
      );
    }
  }

  static Future<APIResult> callMultipartPostAPI({
    required String name,
    Map<String, String>? params,
    Map<String, String>? body,
    // Map<String, PlatformFile>? files,
  }) async {
    try {
      final urlBuffer = StringBuffer()
        ..write(APIUrls.baseUrl)
        ..write(name);

      if (params != null) {
        urlBuffer.write('?');

        for (var i = 0; i < params.length; i++) {
          final param = params.entries.elementAt(i);

          urlBuffer.write('${param.key}=${param.value}');

          if (i < params.length - 1) {
            urlBuffer.write('&');
          }
        }
      }

      final url = Uri.parse(urlBuffer.toString());

      final headers = {
        'Accept': 'application/json',
      };

      final filesList = <http.MultipartFile>[];

      // if (files != null) {
      //   for (final file in files.entries) {
      //     final multipartFile = http.MultipartFile.fromBytes(
      //       file.key,
      //       file.value.bytes!,
      //       filename: file.value.name,
      //     );

      //     filesList.add(multipartFile);
      //   }
      // }

      final request = http.MultipartRequest('POST', url)
        ..headers.addAll(headers)
        ..fields.addAll(body ?? {})
        ..files.addAll(filesList);

      final response = await request.send();

      final responseBody = await response.stream.bytesToString();

      final jsonResponse = jsonDecode(responseBody) as Map<String, dynamic>;

      final statusCode = jsonResponse['response_code'];

      final data = jsonResponse['response_data'];
      final message = jsonResponse['response_message'] as String?;

      return APIResult(
        success: statusCode == 1,
        message: message,
        data: data,
      );
    } catch (e) {
      DevHelper.log(e.toString());
      return APIResult(
        success: false,
        message: e.toString(),
      );
    }
  }
}
