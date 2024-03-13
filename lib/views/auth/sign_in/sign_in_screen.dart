import 'dart:async';

import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/helpers/snackbar/snackbar_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_container.dart';
import 'package:broker_app/views/app_widgets/app_header.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_button.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/auth/change_pin/change_pin_screen.dart';
import 'package:broker_app/views/auth/forgot_pass/forgot_pass_screen.dart';
import 'package:broker_app/views/auth/verify_pin/verify_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool _hidePass = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppUIUtils.defaultHorizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const AppHeader(),
              _title,
              AppSpaces.v16,
              AppContainer(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        AppSpaces.v32,
                        _phone,
                        AppSpaces.v12,
                        _passField,
                        AppSpaces.v16,
                        _signInButton,
                        AppSpaces.v10,
                        _forgotPass,
                        AppSpaces.v16,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _title {
    return AppText(
      text: 'Login to Your Account',
      style: AppTextStyles.authTitle,
    );
  }

  Widget get _phone {
    return AppTextField(
      labelText: 'Mobile Number',
      controller: _phoneController,
      textInputType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Mobile Number';
        }

        return null;
      },
    );
  }

  Widget get _passField {
    return AppTextField(
      controller: _passController,
      labelText: 'Password',
      obscureText: _hidePass,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter password';
        }

        return null;
      },
      suffix: IconButton(
        onPressed: () {
          _hidePass = !_hidePass;
          setState(() {});
        },
        icon: Icon(
          _hidePass ? Icons.visibility_off_rounded : Icons.visibility,
        ),
      ),
    );
  }

  Widget get _forgotPass {
    return Align(
      alignment: Alignment.centerRight,
      child: AppTextButton(
        dense: true,
        text: 'Forgot Password?',
        onPressed: () {
          NavHelper.navigate(
            context: context,
            screen: const ForgotPassScreen(),
          );
        },
        textStyle: AppTextStyles.defaultTextButton.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget get _signInButton {
    return AppButton(
      onPressed: _signInPressed,
      text: 'Login',
      isLoading: _isLoading,
    );
  }

  Future<void> _signInPressed() async {
    if (_isLoading) return;

    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    final phone = _phoneController.text.trim();
    final pass = _passController.text.trim();

    _isLoading = true;
    setState(() {});

    final error = await AuthHelper.login(
      phone: phone,
      pass: pass,
    );

    if (!mounted) return;

    _isLoading = false;
    setState(() {});

    if (error != null) {
      SnackBarHelpers.showErrorSnackBar(context, error);
      return;
    }

    if (AppGlobals.instance.hasPin ?? false) {
      NavHelper.navigate(
        context: context,
        screen: const VerifyPinScreen(),
        removeAll: true,
      );
    } else {
      NavHelper.navigate(
        context: context,
        screen: const ChangePinScreen(
          pin: null,
        ),
        removeAll: true,
      );
    }

    SnackBarHelpers.showSuccessSnackBar(context, 'Login successful');
  }
}
