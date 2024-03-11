import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppConfirmSheet extends StatelessWidget {
  const AppConfirmSheet({
    required this.title,
    required this.confirmText,
    required this.actionButtonText,
    required this.onConfirm,
    super.key,
  });

  final String title;
  final String confirmText;
  final String actionButtonText;
  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppUIUtils.primaryRadius),
          topRight: Radius.circular(AppUIUtils.primaryRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title,
          AppSpaces.v8,
          _confirmText,
          AppSpaces.v32,
          _actions(context),
        ],
      ),
    );
  }

  Widget get _title {
    return AppText(
      text: title,
      style: AppTextStyles.alertDialogTitle,
    );
  }

  Widget get _confirmText {
    return AppText(
      text: confirmText,
      style: AppTextStyles.alertDialogText,
    );
  }

  Widget _actions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            text: AppStrings.cancel,
            onPressed: () {
              NavHelper.pop(context);
            },
            // color: AppColors.primary.withOpacity(0.2),
            // textStyle:
            //     AppTextStyles.appButton.copyWith(color: AppColors.primary),
          ),
        ),
        AppSpaces.h20,
        Expanded(
          child: AppButton(
            onPressed: () {
              NavHelper.pop(context);
              onConfirm();
            },
            text: actionButtonText,
          ),
        ),
      ],
    );
  }
}
