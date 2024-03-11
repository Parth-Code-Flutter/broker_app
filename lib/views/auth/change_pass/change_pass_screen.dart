import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/helpers/snackbar/snackbar_helper.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_header.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/auth/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';


class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({
    required this.phone,
    required this.pass,
    super.key,
  });

  final String phone;
  final String? pass;

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  late String _phone;
  String? _pass;

  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _cPassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  bool _hidePass = true;

  bool _hideReTypePass = true;

  @override
  void initState() {
    super.initState();
    _setPass();
  }

  void _setPass() {
    _phone = widget.phone;
    _pass = widget.pass;
  }

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
                    AppSpaces.v36,
                    if (_pass == null) _oldPassField,
                    AppSpaces.v16,
                    _passField,
                    AppSpaces.v16,
                    _reTypePassField,
                    AppSpaces.v36,
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
      text: 'Change Password',
      style: AppTextStyles.authTitle,
    );
  }

  Widget get _submitButton {
    return AppButton(
      onPressed: _submitPressed,
      text: 'Submit',
      isLoading: _isLoading,
    );
  }

  Widget get _passField {
    return AppTextField(
      controller: _passController,
      labelText: 'New Password',
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

  Widget get _oldPassField {
    return AppTextField(
      controller: _passController,
      labelText: 'Current Password',
      obscureText: _hidePass,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter current password';
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

  Widget get _reTypePassField {
    return AppTextField(
      controller: _cPassController,
      labelText: 'Retype New Password',
      obscureText: _hideReTypePass,
      validator: (value) {
        if (value == null || _passController.text != value) {
          return 'Password does not match';
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

    final oldPass = _oldPassController.text.trim();

    final pass = _passController.text.trim();

    _isLoading = true;
    setState(() {});

    final error = await AuthHelper.changePass(
      phone: _phone,
      oldPass: _pass ?? oldPass,
      pass: pass,
    );

    if (!mounted) return;

    _isLoading = false;
    setState(() {});

    if (error != null) {
      SnackBarHelpers.showErrorSnackBar(context, error);
      return;
    }

    if (_pass == null) {
      NavHelper.pop(context);
      return;
    }

    NavHelper.navigate(
      context: context,
      screen: const SignInScreen(),
      removeAll: true,
    );

    SnackBarHelpers.showSuccessSnackBar(
      context,
      'Password changed successfully',
    );
  }
}
