import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.value,
    this.hintText,
    this.maxLength,
    this.textInputType,
    this.error,
    this.inputFormatters,
    this.maxLines,
    this.minLines,
    this.prefix,
    this.suffix,
    this.showCounter = false,
    this.labelText,
    this.labelStyle,
    this.hintStyle,
    this.floatingLabelStyle,
    this.readOnly = false,
    this.onTap,
    this.fieldTitle,
    this.isRequired = false,
    this.exText,
    this.fillColor,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 8,
      vertical: 12,
    ),
    this.focusNode,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final String? value;
  final String? hintText;
  final int? maxLength;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? error;
  final int? maxLines;
  final int? minLines;
  final Widget? prefix;
  final Widget? suffix;
  final bool showCounter;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? floatingLabelStyle;
  final bool readOnly;
  final void Function()? onTap;
  final String? fieldTitle;
  final bool isRequired;
  final String? exText;
  final Color? fillColor;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null) ...[
          _title,
          AppSpaces.v8,
        ],
        TextFormField(
          controller: controller,
          cursorColor: AppColors.primary,
          style: AppTextStyles.textFieldText,
          keyboardType: textInputType,
          textCapitalization: TextCapitalization.sentences,
          onChanged: onChanged,
          textInputAction: TextInputAction.next,
          maxLength: maxLength,
          initialValue: value,
          inputFormatters: inputFormatters,
          maxLines: maxLines ?? 1,
          minLines: minLines ?? 1,
          readOnly: readOnly,
          onTap: onTap,
          focusNode: focusNode,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            fillColor: fillColor ?? AppColors.textFieldBg,
            filled: true,
            isDense: true,
            contentPadding: padding,
            hintText: hintText,
            hintStyle: hintStyle ?? AppTextStyles.textFieldHint(),
            counterText: !showCounter ? '' : null,
            labelText: labelText != null
                ? (labelText! + (isRequired ? ' *' : ''))
                : null,
            floatingLabelStyle: AppTextStyles.textFieldLabel(isFloating: true),
            labelStyle:
                // labelStyle ?? AppTextStyles.textFieldLabel(isFloating: false),
                labelStyle ?? AppTextStyles.textFieldHint(isFloating: false),
            alignLabelWithHint: true,
            enabledBorder: _enabledBorder,
            focusedBorder: _focusedBorder,
            errorBorder: _enabledErrorBorder,
            focusedErrorBorder: _focusedErrorBorder,
            prefixIcon: prefix,
            prefixIconConstraints: const BoxConstraints(),
            suffixIcon: suffix,
            suffixIconConstraints: const BoxConstraints(),
          ),
        ),
        if (exText != null) ...[
          AppSpaces.v8,
          _ex,
        ],
      ],
    );
  }

  Widget get _title {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppText(
          text: fieldTitle!,
          style: AppTextStyles.textFieldTitle,
        ),
        if (isRequired)
          AppText(
            text: ' *',
            style: AppTextStyles.requiredSign,
          ),
      ],
    );
  }

  Widget get _ex {
    return AppText(
      text: exText!,
      style: AppTextStyles.textFieldExample,
    );
  }

  InputBorder get _enabledBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: error ?? false ? Colors.red : AppColors.textFieldBorder,
        width: error ?? false ? 0.7 : 0.8,
      ),
    );
  }

  InputBorder get _focusedBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: error ?? false ? Colors.red : AppColors.primary,
        width: error ?? false ? 0.7 : 0.8,
      ),
    );
  }

  InputBorder get _enabledErrorBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: AppColors.error,
        width: error ?? false ? 0.7 : 1,
      ),
    );
  }

  InputBorder get _focusedErrorBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: AppColors.primary,
        width: error ?? false ? 0.7 : 1,
      ),
    );
  }
}
