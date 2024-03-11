import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:flutter/material.dart';import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.onPressed,
    required this.text,
    super.key,
    this.color,
    this.isLoading,
    this.padding,
    this.loaderColor,
    this.height,
    this.width,
    this.textStyle,
    this.constraints,
    this.prefix,
    this.elevation,
    this.showBg = true,
  });

  final void Function() onPressed;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final bool? isLoading;
  final Color? loaderColor;
  final double? height;
  final double? width;
  final BoxConstraints? constraints;
  final EdgeInsets? padding;
  final Widget? prefix;
  final double? elevation;
  final bool showBg;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      height: 50,
      child: Stack(
        children: [
          if (showBg)
            Align(
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  width: 240,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: AppUIUtils.primaryBorderRadius,
                  ),
                ),
              ),
            ),
          Center(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  elevation: elevation,
                  shadowColor: color ?? AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppUIUtils.primaryBorderRadius,
                  ),
                  minimumSize: Size.zero,
                  padding: padding ??
                      const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                  backgroundColor: color ?? AppColors.buttonBg,
                ),
                child: isLoading ?? false
                    ? AppLoader(
                        center: false,
                        color: loaderColor ?? AppColors.pureWhite,
                        height: 24,
                        width: 24,
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (prefix != null) prefix!,
                          AppText(
                            text: text,
                            style: textStyle ?? AppTextStyles.appButton,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
