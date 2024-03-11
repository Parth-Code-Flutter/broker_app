import 'package:another_flushbar/flushbar.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SnackBarHelpers {
  static void showErrorSnackBar(BuildContext context, String text) {
    Flushbar<void>(
      message: text,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      leftBarIndicatorColor: Colors.white,
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.error,
    ).show(context);
  }

  static void showSuccessSnackBar(BuildContext context, String text) {
    Flushbar<void>(
      message: text,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      leftBarIndicatorColor: Colors.white,
      duration: const Duration(seconds: 3),
      backgroundColor: AppColors.success,
    ).show(context);
  }
}
