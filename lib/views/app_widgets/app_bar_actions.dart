import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/views/app_widgets/app_image.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/dashboard/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppAssets.notificationIcon,
          height: 25,
          width: 20,
        ),
        AppSpaces.h8,
        GestureDetector(
          onTap: () => NavHelper.navigate(
            context: context,
            screen: ProfileScreen(),
          ),
          child: CircleAvatar(
            backgroundColor: AppColors.whiteBg,
            radius: 15,
            child: AppImage.asset(path: AppAssets.dummyProfile),
          ),
        ),
        AppSpaces.h16,
      ],
    );
  }
}
