import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppRadioButton<T> extends StatelessWidget {
  const AppRadioButton({
    required this.labelText,
    required this.value,
    required this.groupValue,
    super.key,
    this.labelStyle,
    this.onChanged,
  });

  final T value;
  final void Function(T? value)? onChanged;
  final T? groupValue;
  final String labelText;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(value);
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Radio<T>(
                fillColor: MaterialStateColor.resolveWith(
                  (states) => AppColors.primary,
                ),
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            AppSpaces.h4,
            AppText(
              text: labelText,
              style: labelStyle ?? AppTextStyles.appRadioLabel,
            ),
          ],
        ),
      ),
    );
  }
}
