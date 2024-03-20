import 'package:broker_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'providers/app_provider.dart';
import 'utils/colors/app_colors.dart';
import 'utils/keys/app_ui_keys.dart';
import 'views/auth/change_pin/change_pin_screen.dart';
import 'views/auth/sign_in/sign_in_screen.dart';
import 'views/auth/verify_pin/verify_pin_screen.dart';

class AppMain extends StatefulWidget {
  const AppMain({
    required this.isAuthenticated,
    required this.hasPin,
    super.key,
  });

  final bool isAuthenticated;
  final bool hasPin;

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  late bool _isAuthenticated;
  late bool _hasPin;

  @override
  void initState() {
    super.initState();
    _setIsAuthenticated();
  }

  void _setIsAuthenticated() {
    _isAuthenticated = widget.isAuthenticated;
    _hasPin = widget.hasPin;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mona Water',
            theme: _themeData,
            navigatorKey: AppUIKeys.navKey,
            home: _home,
          );
        },
      ),
    );
  }

  Widget get _home {
    return SplashScreen(
      isAuthenticated: _isAuthenticated,
      hasPin: _hasPin,
    );
    // if (!_isAuthenticated) {
    //   return const SignInScreen();
    // }
    //
    // if (!_hasPin) {
    //   return const ChangePinScreen(
    //     pin: null,
    //   );
    // }
    //
    // return const VerifyPinScreen();
  }

  ThemeData get _themeData => ThemeData(
        textSelectionTheme: _textSelectionThemeData,
        colorScheme: _colorScheme,
        useMaterial3: true,
      );

  TextSelectionThemeData get _textSelectionThemeData => TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary.withOpacity(0.3),
        selectionHandleColor: AppColors.primary,
      );

  ColorScheme get _colorScheme => ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        background: AppColors.whiteBg,
        surface: AppColors.whiteBg,
      );
}
