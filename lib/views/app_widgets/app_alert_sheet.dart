import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    required this.title,
    required this.alertText,
    required this.actionButtonText,
    required this.onOverride,
    super.key,
  });

  final String title;
  final String alertText;
  final String actionButtonText;
  final void Function() onOverride;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
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
          _alertText,
          AppSpaces.v32,
          _actions(context),
        ],
      ),
    );
  }

  Widget get _title {
    return AppText(
      text: title,
      style: AppTextStyles.alertDialogTitle.copyWith(color: AppColors.whiteText),
    );
  }

  Widget get _alertText {
    return AppText(
      text: alertText,
      style: AppTextStyles.alertDialogText.copyWith(color: AppColors.whiteText),
    );
  }

  Widget _actions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            showBg: false,
            text: AppStrings.cancel,
            onPressed: () {
              NavHelper.pop(context);
            },
            color: AppColors.whiteText,
            textStyle: AppTextStyles.appButton.copyWith(color: AppColors.error),
          ),
        ),
        AppSpaces.h20,
        Expanded(
          child: AppButton(
            showBg: false,
            onPressed: () {
              NavHelper.pop(context);
              onOverride();
            },
            text: actionButtonText,
            color: AppColors.error,
          ),
        ),
      ],
    );
  }
}
