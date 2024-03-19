// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/helpers/snackbar/snackbar_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_container.dart';
import 'package:broker_app/views/app_widgets/app_header.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_button.dart';
import 'package:broker_app/views/auth/forgot_pass/forgot_pass_screen.dart';
import 'package:broker_app/views/auth/year_selection/year_selection_screen.dart';
import 'package:broker_app/views/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

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
                        AppSpaces.v36,
                        _pinField,
                        AppSpaces.v16,
                        _forgotPin,
                        AppSpaces.v32,
                        _submitButton,
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
      text: 'Enter PIN',
      style: AppTextStyles.authTitle,
    );
  }

  Widget get _forgotPin {
    return Align(
      alignment: Alignment.centerRight,
      child: AppTextButton(
        dense: true,
        text: 'Forgot PIN?',
        onPressed: () {
          NavHelper.navigate(
            context: context,
            screen: const ForgotPassScreen(
              pin: true,
            ),
          );
        },
        textStyle: AppTextStyles.defaultTextButton.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget get _pinField {
    return SizedBox(
      height: 0.12.screenWidth,
      child: PinCodeTextField(
        appContext: context,
        controller: _pinController,
        length: 6,
        autoDismissKeyboard: true,
        keyboardType: TextInputType.phone,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (String value) {},
        textStyle: AppTextStyles.defaultTextButton
            .copyWith(color: AppColors.blackShade),
        errorTextSpace: 20,
        enablePinAutofill: true,
        obscureText: true,
        obscuringCharacter: '*',
        obscuringWidget: Padding(
          padding: EdgeInsets.only(top: 0.01.screenHeight),
          child: Text(
            '*',
            style: AppTextStyles.defaultTextButton
                .copyWith(color: AppColors.blackShade),
          ),
        ),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 0.12.screenWidth,
          fieldWidth: 0.11.screenWidth,
          borderWidth: 1,
          activeBorderWidth: 1,
          selectedBorderWidth: 1,
          errorBorderWidth: 1,
          inactiveBorderWidth: 1,

          /// kColorFFEDD7
          activeFillColor: AppColors.textFieldBorder,
          inactiveFillColor: AppColors.primary,
          inactiveColor: AppColors.textFieldBorder,
          // disabledColor: Colors.green,
          // activeColor: kColorPrimary,
          // selectedFillColor: Colors.pink,
          selectedColor: AppColors.primary,
          // errorBorderColor: kColorErrorRed,
        ),
        cursorColor: Colors.black,
        onEditingComplete: () {},
        onCompleted: (v) {
          _pinController.text = v;
          _submitPressed();
        },
        onSubmitted: (value) {
          _pinController.text = value;
          _submitPressed();
        },
        // validator: (v) {
        //   // return Validate.otpValidation(context, v ?? '');
        // },
      ),
      // OtpTextField(
      //   fieldWidth: 0.11.screenWidth,
      //   obscureText: true,
      //   numberOfFields: 6,
      //   borderColor: AppColors.textFieldBorder,
      //   focusedBorderColor: AppColors.primary,
      //   borderRadius: AppUIUtils.primaryBorderRadius,
      //   borderWidth: 1,
      //   showFieldAsBox: true,
      //   onCodeChanged: (String code) {
      //     // _otpController.text = code;
      //   },
      //   onSubmit: (String verificationCode) {
      //     _pinController.text = verificationCode;
      //     _submitPressed();
      //   }, // end onSubmit
      // ),
    );
  }

  Widget get _submitButton {
    return AppButton(
      onPressed: _submitPressed,
      text: 'Submit',
      isLoading: _isLoading,
    );
  }

  Future<void> _submitPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_isLoading) return;

    final valid = _formKey.currentState?.validate() ?? false;

    if (!valid) return;

    final pin = _pinController.text.trim();

    _isLoading = true;
    setState(() {});

    final result = await AuthHelper.verifyPin(
      pin: pin,
    );

    if (!mounted) return;

    _isLoading = false;
    setState(() {});

    if (!result.success || result.data == null) {
      _pinController.text ='';
      SnackBarHelpers.showErrorSnackBar(
        context,
        result.eMsg ?? AppStrings.eSomethingWrong,
      );
      return;
    }

    AppGlobals.instance.userName = result.data['userName'] as String? ?? '';
    AppGlobals.instance.userType = result.data['userType'] as String? ?? '';

    NavHelper.navigate(
        context: context, screen: const YearSelectionScreen(), removeAll: true);
    // context: context, screen: const DashboardScreen(), removeAll: true);

    // SnackBarHelpers.showSuccessSnackBar(context, 'PIN verified successfully');
  }
}
