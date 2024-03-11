import 'package:broker_app/utils/keys/app_ui_keys.dart';
import 'package:flutter/material.dart';

class NavHelper {
  static void navigate({
    required BuildContext context,
    required Widget screen,
    bool? replacement,
    bool? removeAll,
    // PageTransitionType? type,
  }) {
    if (removeAll ?? false) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
          builder: (context) => screen,
        ),
        (route) => false,
      );
      return;
    }
    if (replacement ?? false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (context) => screen,
        ),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => screen,
      ),
    );
  }

  static BuildContext get globalContext {
    return AppUIKeys.navKey.currentContext!;
  }

  static void pop(BuildContext context, {bool maybePop = false}) {
    if (maybePop) {
      Navigator.maybePop(context);
    } else {
      Navigator.pop(context);
    }
  }
}
