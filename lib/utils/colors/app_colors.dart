import 'package:broker_app/utils/enums/theme_type.dart';
import 'package:flutter/material.dart';

class AppColors {
  /// --------------------------------------------------------------------------

  //
  static final AppColor _primary = AppColor(
    light: const Color.fromRGBO(242, 126, 2, 1),
    dark: const Color.fromRGBO(242, 126, 2, 1),
  );

  static final AppColor _secondary = AppColor(
    light: const Color.fromRGBO(236, 29, 37, 1),
    dark: const Color.fromRGBO(236, 29, 37, 1),
  );

  static final AppColor _pureWhite = AppColor(
    light: const Color.fromRGBO(255, 255, 255, 1),
    dark: const Color.fromRGBO(255, 255, 255, 1),
  );

  /// --------------------------------------------------------------------------

  // Text
  static final AppColor _primaryText = AppColor(
    light: const Color.fromRGBO(48, 48, 48, 1),
    dark: const Color.fromRGBO(255, 255, 255, 1),
  );

  static final AppColor _whiteText = AppColor(
    light: const Color.fromRGBO(255, 255, 255, 1),
    dark: const Color.fromRGBO(48, 48, 48, 1),
  );

  static final AppColor _lightGreyText = AppColor(
    light: const Color.fromRGBO(192, 192, 192, 1),
    dark: const Color.fromRGBO(192, 192, 192, 1),
  );

  static final AppColor _darkGreyText = AppColor(
    light: const Color.fromRGBO(140, 139, 138, 1),
    dark: const Color.fromRGBO(140, 139, 138, 1),
  );

  static final AppColor _redText = AppColor(
    light: const Color.fromRGBO(255, 0, 0, 1),
    dark: const Color.fromRGBO(255, 0, 0, 1),
  );
  static final AppColor _redDarkText = AppColor(
    light: const Color.fromRGBO(203, 60, 43, 1),
    dark: const Color.fromRGBO(203, 60, 43, 1),
  );

  static final AppColor _pureWhiteText = AppColor(
    light: const Color.fromRGBO(255, 255, 255, 1),
    dark: const Color.fromRGBO(255, 255, 255, 1),
  );

  static final AppColor _goldenText = AppColor(
    light: const Color.fromRGBO(182, 145, 35, 1),
    dark: const Color.fromRGBO(182, 145, 35, 1),
  );

  static final AppColor _dataFieldTitle = AppColor(
    light: const Color.fromRGBO(161, 161, 163, 1),
    dark: const Color.fromRGBO(161, 161, 163, 1),
  );

  /// --------------------------------------------------------------------------

  // Bg
  static final AppColor _primaryBg = AppColor(
    light: const Color.fromRGBO(255, 255, 255, 1),
    dark: const Color.fromRGBO(255, 255, 255, 1),
  );

  static final AppColor _whiteBg = AppColor(
    light: const Color.fromRGBO(255, 255, 255, 1),
    dark: const Color.fromRGBO(255, 255, 255, 1),
  );

  static final AppColor _buttonBg = AppColor(
    light: const Color.fromRGBO(34, 21, 94, 1),
    dark: const Color.fromRGBO(34, 21, 94, 1),
  );

  static final AppColor _authBg = AppColor(
    light: const Color.fromRGBO(255, 217, 169, 1),
    dark: const Color.fromRGBO(255, 217, 169, 1),
  );

  static final AppColor _lightPrimaryBg = AppColor(
    light: const Color.fromRGBO(255, 237, 243, 1),
    dark: const Color.fromRGBO(255, 237, 243, 1),
  );

  static final AppColor _lightGreyBg = AppColor(
    light: const Color.fromRGBO(236, 236, 236, 1),
    dark: const Color.fromRGBO(236, 236, 236, 1),
  );

  static final AppColor _textFieldBg = AppColor(
    light: const Color.fromRGBO(255, 255, 255, 1),
    dark: const Color.fromRGBO(255, 255, 255, 1),
  );

  static final AppColor _success = AppColor(
    light: const Color.fromRGBO(18, 96, 60, 1),
    dark: const Color.fromRGBO(18, 96, 60, 1),
  );

  static final AppColor _error = AppColor(
    light: const Color.fromRGBO(220, 53, 69, 1),
    dark: const Color.fromRGBO(220, 53, 69, 1),
  );

  static final AppColor _pureWhiteBg = AppColor(
    light: const Color.fromRGBO(255, 255, 255, 1),
    dark: const Color.fromRGBO(255, 255, 255, 1),
  );

  static final AppColor _eliteBg = AppColor(
    light: const Color.fromRGBO(253, 246, 231, 1),
    dark: const Color.fromRGBO(253, 246, 231, 1),
  );

  static final AppColor _ratedStarBg = AppColor(
    light: const Color.fromRGBO(255, 193, 7, 1),
    dark: const Color.fromRGBO(255, 193, 7, 1),
  );

  static final AppColor _unratedStarBg = AppColor(
    light: const Color.fromRGBO(255, 193, 7, 0.2),
    dark: const Color.fromRGBO(255, 193, 7, 0.2),
  );

  static final AppColor _detailsCardBg = AppColor(
    light: const Color.fromRGBO(240, 245, 255, 1),
    dark: const Color.fromRGBO(240, 245, 255, 1),
  );

  static final AppColor _insuranceCardBg1 = AppColor(
    light: const Color.fromRGBO(248, 244, 233, 1),
    dark: const Color.fromRGBO(248, 244, 233, 1),
  );

  static final AppColor _insuranceCardBg2 = AppColor(
    light: const Color.fromRGBO(241, 241, 241, 1),
    dark: const Color.fromRGBO(241, 241, 241, 1),
  );

  /// --------------------------------------------------------------------------

  // Borders
  static final AppColor _textFieldBorder = AppColor(
    light: const Color.fromRGBO(191, 191, 192, 1),
    dark: const Color.fromRGBO(191, 191, 192, 1),
  );

  /// --------------------------------------------------------------------------

  // Gradients
  static final AppGradient _primaryGradient = AppGradient(
    light: const LinearGradient(
      colors: [
        Color.fromRGBO(244, 1, 80, 1),
        Color.fromRGBO(178, 1, 59, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    dark: const LinearGradient(
      colors: [
        Color.fromRGBO(244, 1, 80, 1),
        Color.fromRGBO(178, 1, 59, 1),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

  /// --------------------------------------------------------------------------

  static ThemeType type = ThemeType.light;

  /// --------------------------------------------------------------------------

  static Color get primary => _primary.color(type);
  static Color primaryWithT({double t = 0.1}) =>
      _primary.color(type).withOpacity(t);
  static Color get secondary => _secondary.color(type);
  static Color get pureWhite => _pureWhite.color(type);

  /// --------------------------------------------------------------------------

  static Color get primaryText => _primaryText.color(type);
  static Color get whiteText => _whiteText.color(type);
  static Color get lightGreyText => _lightGreyText.color(type);
  static Color get darkGreyText => _darkGreyText.color(type);
  static Color get redText => _redText.color(type);
  static Color get redDarkText => _redDarkText.color(type);
  static Color get pureWhiteText => _pureWhiteText.color(type);
  static Color get goldenText => _goldenText.color(type);
  static Color get dataFieldTitle => _dataFieldTitle.color(type);

  /// --------------------------------------------------------------------------

  static Color get primaryBg => _primaryBg.color(type);
  static Color get whiteBg => _whiteBg.color(type);
  static Color get buttonBg => _buttonBg.color(type);
  static Color get lightPrimaryBg => _lightPrimaryBg.color(type);
  static Color get lightGreyBg => _lightGreyBg.color(type);
  static Color get authBg => _authBg.color(type);
  static Color get textFieldBg => _textFieldBg.color(type);
  static Color get success => _success.color(type);
  static Color get error => _error.color(type);
  static Color get pureWhiteBg => _pureWhiteBg.color(type);
  static Color get eliteBg => _eliteBg.color(type);
  static Color get ratedStarBg => _ratedStarBg.color(type);
  static Color get unratedStarBg => _unratedStarBg.color(type);
  static Color get detailsCardBg => _detailsCardBg.color(type);
  static Color get insuranceCardBg1 => _insuranceCardBg1.color(type);
  static Color get insuranceCardBg2 => _insuranceCardBg2.color(type);

  /// --------------------------------------------------------------------------

  static Color get textFieldBorder => _textFieldBorder.color(type);

  /// --------------------------------------------------------------------------

  static Gradient get primaryGradient => _primaryGradient.gradient(type);
}

class AppColor {
  AppColor({
    required this.light,
    required this.dark,
  });
  Color light;
  Color dark;

  Color color(ThemeType type) {
    return type == ThemeType.light ? light : dark;
  }
}

/// A Model of app's gradient
/// which carries `light` and `dark` version of this gradient
class AppGradient {
  AppGradient({
    required this.light,
    required this.dark,
  });

  Gradient light;
  Gradient dark;

  Gradient gradient(ThemeType type) {
    return type == ThemeType.light ? light : dark;
  }
}
