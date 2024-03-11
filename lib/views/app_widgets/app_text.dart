import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    required this.text,
    super.key,
    this.style,
    this.align,
    this.overflow,
    this.maxLines,
    this.isRequired = false,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: style ?? AppTextStyles.defaultText,
          textAlign: align,
          overflow: overflow,
          maxLines: maxLines,
        ),
        if (isRequired)
          AppText(
            text: '*',
            style: AppTextStyles.requiredSignDark,
          ),
      ],
    );
    // Text(
    // text,
    // style: style ?? AppTextStyles.defaultText,
    // textAlign: align,
    // overflow: overflow,
    // maxLines: maxLines,
    // );
  }
}
