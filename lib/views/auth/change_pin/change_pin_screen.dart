import 'dart:async';

import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/local_storage/shared_prefs_helper.dart';
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
import 'package:broker_app/views/auth/sign_in/sign_in_screen.dart';
import 'package:broker_app/views/auth/verify_pin/verify_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({
    required this.pin,
    super.key,
    this.hasPin = false,
  });

  final String? pin;
  final bool hasPin;

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
  String? _pin;

  final TextEditingController _oldPinController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _cPassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool _hideOldPass = true;

  bool _hidePass = true;

  bool _hideReTypePass = true;

  @override
  void initState() {
    super.initState();
    _setPass();
  }

  void _setPass() {
    _pin = widget.pin;
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        // AppSpaces.v36,
                        if (_pin == null && widget.hasPin) _oldPassField,
                        AppSpaces.v16,
                        _passField,
                        AppSpaces.v16,
                        _reTypePassField,
                        AppSpaces.v20,
                        _submitButton,
                        AppSpaces.v32,
                        _backToLogin,
                        AppSpaces.v20,
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
      text: 'Change PIN',
      style: AppTextStyles.authTitle,
    );
  }

  Widget get _submitButton {
    return AppButton(
      onPressed: _submitPressed,
      text: 'Change Pin',
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
            NavHelper.navigate(
                context: context, screen: SignInScreen(), removeAll: true);
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

  Widget get _passField {
    return AppTextField(
      controller: _pinController,
      labelText: 'New Pin',
      obscureText: _hidePass,
      textInputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 6,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter PIN';
        }

        if (value.length != 6) {
          return 'PIN must be 6 digits';
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

  Widget get _oldPassField {
    return AppTextField(
      controller: _oldPinController,
      labelText: 'Current PIN',
      obscureText: _hideOldPass,
      textInputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 6,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter current PIN';
        }

        if (value.length != 6) {
          return 'PIN must be 6 digits';
        }

        return null;
      },
      suffix: IconButton(
        onPressed: () {
          _hideOldPass = !_hideOldPass;
          setState(() {});
        },
        icon: Icon(
          _hideOldPass ? Icons.visibility_off_rounded : Icons.visibility,
        ),
      ),
    );
  }

  Widget get _reTypePassField {
    return AppTextField(
      controller: _cPassController,
      labelText: 'Confirm New PIN',
      obscureText: _hideReTypePass,
      textInputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 6,
      validator: (value) {
        if (value == null || _pinController.text != value) {
          return 'PIN does not match';
        }

        if (value.length != 6) {
          return 'PIN must be 6 digits';
        }

        return null;
      },
      suffix: IconButton(
        onPressed: () {
          _hideReTypePass = !_hideReTypePass;
          setState(() {});
        },
        icon: Icon(
          _hideReTypePass ? Icons.visibility_off_rounded : Icons.visibility,
        ),
      ),
    );
  }

  Future<void> _submitPressed() async {
    if (_isLoading) return;

    final valid = _formKey.currentState?.validate() ?? false;

    if (!valid) return;

    final oldPass = _oldPinController.text.trim();

    final pass = _pinController.text.trim();

    _isLoading = true;
    setState(() {});

    final error = await AuthHelper.changePin(
      oldPin: oldPass.isNotEmpty ? oldPass : _pin,
      pin: pass,
    );

    if (!mounted) return;

    _isLoading = false;
    setState(() {});

    if (error != null) {
      SnackBarHelpers.showErrorSnackBar(context, error);
      return;
    }

    unawaited(SharedPrefsHelper.setHasPin(true));

    AppGlobals.instance.hasPin = true;

    if (widget.hasPin) {
      NavHelper.pop(context);
      return;
    }

    NavHelper.navigate(
      context: context,
      screen: const VerifyPinScreen(),
      removeAll: true,
    );

    SnackBarHelpers.showSuccessSnackBar(
      context,
      'PIN changed successfully',
    );
  }
}
