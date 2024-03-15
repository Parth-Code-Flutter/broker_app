import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/views/app_widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
    this.primaryPage = false,
    this.color,
  });

  final void Function()? onPressed;
  final bool primaryPage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if (primaryPage) {
              // context.read<PrimaryScreenProvider>().clean();
            } else {
              NavHelper.pop(context, maybePop: true);
            }
            if (onPressed == null) return;
            onPressed!();
          },
          child: SvgPicture.asset(AppAssets.backArrowIcon),
        ),
        // const AppLogo(
        //   height: 24,
        //   width: 24,
        // ),
      ],
    );
  }
}
