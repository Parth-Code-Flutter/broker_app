// ignore_for_file: avoid_positional_boolean_parameters

import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static double get superLargeFontSize => 28;

  static double get extraMediumLargeFontSize => 26;

  static double get extraLargeFontSize => 22;

  static double get largeFontSize => 20;

  static double get defaultFontSize => 18;

  static double get smallFontSize => 16;

  static double get extraSmallFontSize => 14;

  static double get tinyFontSize => 12;

  static TextStyle appStyle({required TextStyle textStyle}) =>
      textStyle.copyWith(fontFamily: 'Inter');

  static double getTextHeight(TextStyle style, {int maxLines = 1}) {
    final textPainter = TextPainter(
      text: TextSpan(
        text:
            'jsnsiuhbhhjhbddbdnhdbnb hbv dbd hhdb hd h s  hbuhd h vsb jhbssb djhdu ddhb s ',
        style: style,
      ),
      maxLines: maxLines, // You can adjust this based on your requirements
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 100);

    return textPainter.height;
  }

  /// --------------------------------------------------------------------------

  //
  static TextStyle get defaultText => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get appButton => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteText,
        ),
      );

  static TextStyle get defaultTextButton => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
      );

  static TextStyle get appBarAppName => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.pureWhiteText,
        ),
      );

  static TextStyle get appBarTitle => appStyle(
        textStyle: TextStyle(
          // fontSize: defaultFontSize,
          fontSize: smallFontSize,
          fontWeight: FontWeight.w700,
          // color: AppColors.primaryText,
          color: AppColors.whiteText,
        ),
      );

  static TextStyle bottomNavBar(bool isSelected) => appStyle(
        textStyle: TextStyle(
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
          color: isSelected ? AppColors.pureWhiteText : AppColors.pureWhiteText,
        ),
      );

  static TextStyle get defaultLoaderText => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get textFieldText => appStyle(
        textStyle: TextStyle(
          // fontSize: smallFontSize,
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle textFieldHint({bool isFloating = false}) => appStyle(
        textStyle: TextStyle(
          // fontSize: smallFontSize,
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.normal,
          color: isFloating ? AppColors.primary : AppColors.lightGreyText,
        ),
      );

  static TextStyle get textFieldTitle => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get dashboardText => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get requiredSign => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.redText,
        ),
      );

  static TextStyle get requiredSignDark => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.redDarkText,
        ),
      );

  static TextStyle get textFieldExample => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.darkGreyText,
        ),
      );

  static TextStyle get textFieldBlackShade => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.blackShade,
        ),
      );

  static TextStyle textFieldLabel({required bool isFloating}) => appStyle(
        textStyle: TextStyle(
          fontSize: isFloating ? smallFontSize : smallFontSize,
          fontWeight: FontWeight.normal,
          color: isFloating ? AppColors.primary : AppColors.darkGreyText,
        ),
      );

  static TextStyle get bottomSheetTitle => appStyle(
        textStyle: TextStyle(
          fontSize: largeFontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get logout => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.error,
        ),
      );

  static TextStyle get alertDialogTitle => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get alertDialogText => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get empty => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle filterButton(bool isSelected) => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.primary : AppColors.darkGreyText,
        ),
      );

  static TextStyle get drawerTitle => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );

  static TextStyle drawerItem(bool isSelected) => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: isSelected ? AppColors.primary : AppColors.darkGreyText,
        ),
      );

  static TextStyle get dialogHeader => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get dataFieldTitle => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.dataFieldTitle,
        ),
      );

  static TextStyle get dataFieldValue => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
      );

  static TextStyle get appRadioLabel => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Auth
  static TextStyle get authTitle => appStyle(
        textStyle: TextStyle(
          fontSize: extraMediumLargeFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Orders
  static TextStyle get orderNumber => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );

  static TextStyle get orderFieldTitle => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get orderFieldValue => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Products
  static TextStyle get productName => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );

  static TextStyle get productRateName => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get productRateValue => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w400,
          color: Colors.blue,
        ),
      );

  /// --------------------------------------------------------------------------

  // Car Insurance
  static TextStyle get carInsurancePromotion => appStyle(
        textStyle: TextStyle(
          fontSize: largeFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.goldenText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Home
  static TextStyle get homeNamaste => appStyle(
        textStyle: TextStyle(
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get homeUserName => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.goldenText,
        ),
      );

  static TextStyle get homeLetsGetInsured => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get homeToGether => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.goldenText,
        ),
      );

  static TextStyle get homeInsuranceName => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get homeYourDocuments => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get homeDocName => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get homeAppName => appStyle(
        textStyle: TextStyle(
          fontSize: extraLargeFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Support
  static TextStyle get supportTitle => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );

  static TextStyle get supportSubTitle => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyText,
        ),
      );

  /// --------------------------------------------------------------------------

  // My Family
  static TextStyle get memberName => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get memberAge => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.darkGreyText,
        ),
      );

  static TextStyle get memberRelation => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.darkGreyText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Verify OTP
  static TextStyle get verifyOTPTitle => appStyle(
        textStyle: TextStyle(
          fontSize: extraLargeFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );

  static TextStyle get verifyOTPDesc => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Sign Up
  static TextStyle get tnc => appStyle(
        textStyle: TextStyle(
          fontSize: extraSmallFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.darkGreyText,
        ),
      );

  /// --------------------------------------------------------------------------

  // Sign In
  static TextStyle get notHaveAcc => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w500,
          color: AppColors.darkGreyText,
        ),
      );

  static TextStyle get registerFirst => appStyle(
        textStyle: TextStyle(
          fontSize: smallFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      );

  /// --------------------------------------------------------------------------

  // Master Entry
  static TextStyle get tinyTextStyle => appStyle(
        textStyle: TextStyle(
          fontSize: tinyFontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get tinyListTextStyle => appStyle(
        textStyle: TextStyle(
          fontSize: tinyFontSize,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryText,
        ),
      );

  static TextStyle get tinyLabelTextStyle => appStyle(
        textStyle: TextStyle(
          fontSize: tinyFontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.greyShade,
        ),
      );
}
