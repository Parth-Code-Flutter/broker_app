import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_alert_sheet.dart';
import 'package:broker_app/views/app_widgets/app_confirm_sheet.dart';
import 'package:flutter/material.dart';

class AppDialogs {
  // static void uploadImage({
  //   required BuildContext context,
  //   required void Function({required bool isCamera}) onSelected,
  // }) {
  //   _showBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return UploadImageSheet(
  //         onSelected: onSelected,
  //       );
  //     },
  //   );
  // }

  static Future<void> selectDate({
    required BuildContext context,
    required void Function(DateTime? date) onSelected,
    required DateTime initialDate,
    required DateTime maxDate,
    required DateTime minDate,
  }) async {
    // showCupertinoModalPopup<void>(
    //   context: context,
    //   builder: (_) => Container(
    //     height: 220,
    //     decoration: BoxDecoration(color: AppColors.primaryBg),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: AppTextButton(
    //             text: AppStrings.done,
    //             onPressed: () {
    //               NavHelper.pop(context);
    //             },
    //           ),
    //         ),
    //         SizedBox(
    //           height: 160,
    //           child: CupertinoDatePicker(
    //             backgroundColor: AppColors.primaryBg,
    //             mode: CupertinoDatePickerMode.date,
    //             minimumDate: minDate,
    //             maximumDate: maxDate,
    //             initialDateTime: initialDate,
    //             onDateTimeChanged: onSelected,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: minDate,
      lastDate: maxDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: AppColors.whiteText,
              onSurface: AppColors.primaryText,
            ),
            dialogBackgroundColor: AppColors.primaryBg,
          ),
          child: child!,
        );
      },
    );

    if (date == null) return;

    onSelected(date);
  }

  static Future<void> alertSheet({
    required BuildContext context,
    required String title,
    required String alertText,
    required String actionButtonText,
    required void Function() onOverride,
  }) async {
    await _showBottomSheet(
      context: context,
      builder: (context) {
        return AppAlertDialog(
          title: title,
          alertText: alertText,
          actionButtonText: actionButtonText,
          onOverride: onOverride,
        );
      },
    );
  }

  static Future<void> confirmSheet({
    required BuildContext context,
    required String title,
    required String confirmText,
    required String actionButtonText,
    required void Function() onConfirm,
  }) async {
    await _showBottomSheet(
      context: context,
      builder: (context) {
        return AppConfirmSheet(
          title: title,
          confirmText: confirmText,
          actionButtonText: actionButtonText,
          onConfirm: onConfirm,
        );
      },
    );
  }

  static Future<void> _showBottomSheet({
    required BuildContext context,
    required Widget Function(BuildContext context) builder,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppUIUtils.primaryRadius),
          topRight: Radius.circular(AppUIUtils.primaryRadius),
        ),
      ),
      backgroundColor: AppColors.primaryBg,
      builder: builder,
    );
  }
}
