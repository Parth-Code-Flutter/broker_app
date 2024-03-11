import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

class DevHelper {
  static void log(dynamic e) {
    if (kDebugMode) {
      dev.log(e.toString());
    }
  }
}
