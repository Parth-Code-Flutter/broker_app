import 'dart:async';

import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/helpers/snackbar/snackbar_helper.dart';
import 'package:broker_app/providers/sign_in/sign_in_provider.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_header.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/auth/verify_otp/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            AppSpaces.v16,
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    _title,
                    AppSpaces.v32,
                    _userId,
                    AppSpaces.v32,
                    _submitButton,
                  ],
                ),
              ),
            ),
          ],
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
      labelText: 'Mobile Number',
      controller: _phoneController,
      textInputType: TextInputType.phone,
      maxLength: 10,
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
      text: 'Verify',
      isLoading: _isLoading,
    );
  }

  Future<void> _submitPressed() async {
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
