// ignore_for_file: use_build_context_synchronously

import 'package:broker_app/helpers/local_storage/shared_prefs_helper.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class InitHelper {
  static Future<void> initApp() async {
    final token = await SharedPrefsHelper.token;

    if (token == null) return;

    final companyId = await SharedPrefsHelper.companyId;

    final decodedToken = JwtDecoder.decode(token);

    AppGlobals.instance.token = token;
    AppGlobals.instance.userId = decodedToken['userId']?.toString();
    AppGlobals.instance.companyId = companyId;
  }

  static Future<void> primary(BuildContext context) async {}
}
