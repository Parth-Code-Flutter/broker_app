import 'dart:async';

import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/helpers/snackbar/snackbar_helper.dart';
import 'package:broker_app/providers/sign_in/sign_in_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_container.dart';
import 'package:broker_app/views/app_widgets/app_header.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/auth/verify_otp/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({
    super.key,
    this.pin = false,
  });

  final bool pin;

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  String? _lastNumber;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowAppIcon: true,
      bgColor: AppColors.primaryBg,
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
                        _userId,
                        AppSpaces.v16,
                        _submitButton,
                        AppSpaces.v32,
                        _backToLogin,
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
      text: widget.pin ? 'Forgot PIN' : 'Forgot Password',
      style: AppTextStyles.authTitle,
    );
  }

  Widget get _userId {
    return AppTextField(
      labelText: 'Enter Registered Mobile no.',
      controller: _phoneController,
      textInputType: TextInputType.phone,
      maxLength: 10,
      suffix: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SvgPicture.asset(AppAssets.phoneIcon),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Mobile Number';
        }

        return null;
      },
    );
  }

  Widget get _submitButton {
    return AppButton(
      onPressed: _submitPressed,
      text: 'Submit',
      isLoading: _isLoading,
    );
  }

  Widget get _backToLogin {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: 'Back to Login? ',
          style: AppTextStyles.textFieldBlackShade,
        ),
        GestureDetector(
          onTap: () {
            NavHelper.pop(context);
          },
          child: AppText(
            text: 'Login',
            style: AppTextStyles.textFieldBlackShade.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Future<void> _submitPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_isLoading) return;

    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    final phone = _phoneController.text.trim();

    final secondsLeft = context.read<SignInProvider>().secondsLeft;

    if (_lastNumber == phone && secondsLeft != 0) {
      final errorText = 'Wait for $secondsLeft seconds';
      SnackBarHelpers.showErrorSnackBar(context, errorText);
      return;
    }

    _isLoading = true;
    setState(() {});

    final error = await AuthHelper.forgotPass(
      phone: phone,
    );

    if (!mounted) return;

    _isLoading = false;
    setState(() {});

    if (error != null) {
      SnackBarHelpers.showErrorSnackBar(context, error);
      return;
    }

    context.read<SignInProvider>().reset();

    _lastNumber = phone;

    NavHelper.navigate(
      context: context,
      screen: VerifyOtpScreen(
        phone: phone,
        pin: widget.pin,
      ),
      removeAll: true,
    );

    SnackBarHelpers.showSuccessSnackBar(context, 'OTP sent successfully');
  }
}
