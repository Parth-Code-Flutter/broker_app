import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/views/app_widgets/app_image.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    // return const AppSvg(
    //   path: AppAssets.logo,
    //   height: 224,
    //   width: 135,
    // );
    return AppImage.asset(
      path: AppAssets.logo,
      height: 180,
      width: width ?? 80,
    );
  }
}
