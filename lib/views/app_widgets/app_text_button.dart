import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.textStyle,
    this.dense,
    this.padding,
  });

  final String text;
  final void Function() onPressed;
  final TextStyle? textStyle;
  final bool? dense;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: AppUIUtils.primaryBorderRadius,
        ),
        minimumSize: dense ?? false ? Size.zero : null,
        tapTargetSize: dense ?? false ? MaterialTapTargetSize.shrinkWrap : null,
        padding: dense ?? false ? (padding ?? EdgeInsets.zero) : null,
      ),
      child: AppText(
        text: text,
        style: textStyle ?? AppTextStyles.defaultTextButton,
      ),
    );
  }
}
