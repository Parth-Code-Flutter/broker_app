import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/views/app_widgets/app_back_button.dart';
import 'package:broker_app/views/app_widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class PrimaryAppBar {
  static AppBar appBar({
    required String title,
    bool primaryPage = false,
    List<Widget>? actions,
  }) {
    return AppBar(
      backgroundColor: AppColors.authBg,
      iconTheme: IconThemeData(
        color: AppColors.primaryText,
      ),
      leading: AppBackButton(
        primaryPage: primaryPage,
        color: AppColors.primaryText,
      ),
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: AppBarTitle(
        title: title,
      ),
      actions: actions,
      leadingWidth: 100,
    );
  }
}
