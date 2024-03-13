import 'dart:async';

import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/helpers/snackbar/snackbar_helper.dart';
import 'package:broker_app/providers/sign_in/sign_in_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_container.dart';
import 'package:broker_app/views/app_widgets/app_header.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/auth/change_pass/change_pass_screen.dart';
import 'package:broker_app/views/auth/change_pin/change_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({
    required this.phone,
    super.key,
    this.pin = false,
  });

  final String phone;
  final bool pin;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late String _phone;
  late TextEditingController _otpController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool _resending = false;

  @override
  void initState() {
    super.initState();
    _setPhone();
  }

  void _setPhone() {
    _phone = widget.phone;
    _otpController = TextEditingController();
    context.read<SignInProvider>().startTimer();
  }

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
                  child: Column(
                    children: [
                      // _title,
                      _subTitle,
                      AppSpaces.v16,
                      _otpField,
                      AppSpaces.v16,
                      _resend,
                      AppSpaces.v36,
                      _submitButton,
                      AppSpaces.v16,
                    ],
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
      text: 'Verify OTP',
      style: AppTextStyles.authTitle,
    );
  }

  Widget get _subTitle {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 36, top: 20),
        child: AppText(
          text: 'Enter OTP',
          style: AppTextStyles.homeDocName,
        ),
      ),
    );
  }

  Widget get _otpField {
    return Center(
      child: SizedBox(
        height: 0.12.screenWidth,
        child: OtpTextField(
          fieldWidth: 0.10.screenWidth,
          numberOfFields: 6,
          borderColor: AppColors.textFieldBorder,
          focusedBorderColor: AppColors.primary,
          borderRadius: AppUIUtils.primaryBorderRadius,
          borderWidth: 1,
          showFieldAsBox: true,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],

          onCodeChanged: (String code) {
            // _otpController.text = code;
          },
          onSubmit: (String verificationCode) {
            _otpController.text = verificationCode;
            _submitPressed();
          }, // end onSubmit
        ),
      ),
    );
  }

  Widget get _resend {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: AppStrings.didntReceive,
          style: AppTextStyles.notHaveAcc,
        ),
        AppSpaces.h8,
        _timeLeft,
      ],
    );
  }

  Widget get _timeLeft {
    return Consumer<SignInProvider>(
      builder: (context, provider, child) {
        final seconds = provider.secondsLeft;

        if (seconds == 0) {
          return InkWell(
            onTap: _resendPressed,
            child: AppText(
              text: AppStrings.sendAgain,
              style: AppTextStyles.registerFirst,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: AppText(
            text: 'resend in $seconds seconds',
            style: AppTextStyles.notHaveAcc,
          ),
        );
      },
    );
  }

  Widget get _submitButton {
    return AppButton(
      onPressed: _submitPressed,
      text: 'Verify',
      isLoading: _isLoading,
    );
  }

  Future<void> _resendPressed() async {
    if (_resending) return;

    final secondsLeft = context.read<SignInProvider>().secondsLeft;

    if (secondsLeft > 0) return;

    _resending = true;
    setState(() {});

    final error = await AuthHelper.resendOtp(
      phone: _phone,
    );

    if (!mounted) return;

    _resending = false;
    setState(() {});

    if (error != null) {
      SnackBarHelpers.showErrorSnackBar(context, error);
      return;
    }

    SnackBarHelpers.showSuccessSnackBar(context, 'OTP sent successfully');

    await context.read<SignInProvider>().startTimer();
  }

  Future<void> _submitPressed() async {
    if (_isLoading) return;

    final valid = _formKey.currentState?.validate() ?? false;

    if (!valid) return;

    if (_otpController.text.trim().length != 6)
      return SnackBarHelpers.showErrorSnackBar(context, 'Please enter otp');

    final otp = _otpController.text.trim();

    _isLoading = true;
    setState(() {});

    final result = await AuthHelper.verifyOtp(
      phone: _phone,
      otp: otp,
      forPass: !widget.pin,
    );

    if (!mounted) return;

    _isLoading = false;
    setState(() {});

    if (!result.success || result.data == null) {
      SnackBarHelpers.showErrorSnackBar(
        context,
        result.eMsg ?? AppStrings.eSomethingWrong,
      );
      return;
    }

    if (widget.pin) {
      NavHelper.navigate(
        context: context,
        screen: ChangePinScreen(
          pin: (result.data as Map<dynamic, dynamic>)['value']?.toString(),
        ),
      );
    } else {
      NavHelper.navigate(
        context: context,
        screen: ChangePassScreen(
          phone: _phone,
          pass: (result.data as Map<dynamic, dynamic>)['value'] as String,
        ),
      );
    }

    SnackBarHelpers.showSuccessSnackBar(context, 'OTP verified successfully');
  }
}
