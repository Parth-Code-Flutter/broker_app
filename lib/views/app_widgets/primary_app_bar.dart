import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/views/app_widgets/app_back_button.dart';
import 'package:broker_app/views/app_widgets/app_bar_actions.dart';
import 'package:broker_app/views/app_widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

AppBar appBar({
  required String title,
  bool primaryPage = false,
  bool isShowBackButton = false,
  bool isShowLogout = false,
  bool isShowActions = true,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: AppColors.primaryBg,
    iconTheme: IconThemeData(
      color: AppColors.primaryText,
    ),
    // leading: AppBackButton(
    //   primaryPage: primaryPage,
    //   color: AppColors.primaryText,
    // ),
    scrolledUnderElevation: 0,
    // centerTitle: true,
    title: Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isShowBackButton)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AppBackButton(
              primaryPage: primaryPage,
            ),
          ),
        AppBarTitle(
          title: title,
        ),
      ],
    ),
    // actions: actions,
    actions: [
     if(isShowActions) AppBarActions(isShowLogout: isShowLogout),
    ],
    leadingWidth: 0,
  );
}
