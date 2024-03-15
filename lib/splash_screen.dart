import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/views/app_widgets/app_image.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:flutter/material.dart';

import 'views/auth/change_pin/change_pin_screen.dart';
import 'views/auth/sign_in/sign_in_screen.dart';
import 'views/auth/verify_pin/verify_pin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    required this.isAuthenticated,
    required this.hasPin,
  });

  final bool isAuthenticated;
  final bool hasPin;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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

    Future.delayed(
      Duration(seconds: 3),
      () {
        if (!_isAuthenticated) {
          NavHelper.navigate(
              context: context, screen: SignInScreen(), removeAll: true);
        } else if (!_hasPin) {
          NavHelper.navigate(
              context: context,
              screen: ChangePinScreen(
                pin: null,
              ),
              removeAll: true);
        } else {
          NavHelper.navigate(
              context: context, screen: VerifyPinScreen(), removeAll: true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: AppImage.asset(
          path: AppAssets.splashScreen,
        ),
      ),
    );
  }
}
