import 'package:broker_app/providers/sign_in/sign_in_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/urls/api_urls.dart';
import 'package:broker_app/views/app_widgets/app_image.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    this.showLogo = true,
  });

  final bool showLogo;

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvider>(
      builder: (context, value, child) {
        return Container(
          // height: 0.4.screenHeight,
          color: AppColors.whiteBg,
          width: 1.screenWidth,
          child: Stack(
            children: [
              if (showLogo) _logo,
              Align(
                alignment: Alignment.bottomCenter,
                child: AppImage.asset(path: AppAssets.bgBottom),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get _logo {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (AppGlobals.instance.appLogo ?? '').isNotEmpty
                ? Image.network(
                    APIUrls.baseUrl2 +
                        '/LogoImg/' +
                        (AppGlobals.instance.appLogo ?? ''),
                    height: 100,
                    width: 230,
                  )
                : AppImage.asset(
                    path: AppAssets.pbLogo,
                    height: 100,
                    width: 230,
                  ),
            AppSpaces.v12,
            // _name,
          ],
        ),
      ),
    );
  }

  Widget get _name {
    return AppText(
      text: 'mona Beverages Pvt. Ltd.',
      style: AppTextStyles.defaultText.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ZigzagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const height = 40;
    final cornerWidth = size.width / 4;

    final path = Path()
      ..lineTo(0, size.height - height)
      ..lineTo(cornerWidth, size.height)
      ..lineTo(cornerWidth * 3, size.height - height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
