import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/dialogs/app_dialogs.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/views/app_widgets/app_image.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/auth/verify_pin/verify_pin_screen.dart';
import 'package:broker_app/views/dashboard/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarActions extends StatelessWidget {
  final bool? isShowLogout;

  const AppBarActions({super.key, this.isShowLogout});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image.asset(
        //   AppAssets.notificationIcon,
        //   height: 24,
        //   width: 20,
        // ),
        // AppSpaces.h8,
        GestureDetector(
          onTap: () => NavHelper.navigate(
            context: context,
            screen: ProfileScreen(),
          ),
          child: CircleAvatar(
            backgroundColor: AppColors.whiteBg,
            radius: 13,
            child: Icon(Icons.person, size: 16),
            // child: AppImage.asset(path: AppAssets.dummyProfile),
          ),
        ),
        AppSpaces.h8,
        if (isShowLogout ?? false)
          IconButton(
            onPressed: () {
              AppDialogs.alertSheet(
                context: context,
                title: AppStrings.logoutAlert,
                alertText: AppStrings.logoutAlertText,
                actionButtonText: AppStrings.logout,
                onOverride: () async {
                  await AuthHelper.logout(context);

                  // ignore: use_build_context_synchronously
                  NavHelper.navigate(
                    context: context,
                    screen: const VerifyPinScreen(),
                    removeAll: true,
                  );
                },
              );
            },
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: AppColors.whiteText,
              child: Icon(
                Icons.logout,
                color: AppColors.redDarkText,
                size: 16,
              ),
            ),
          ),
        AppSpaces.h10,
      ],
    );
  }
}
