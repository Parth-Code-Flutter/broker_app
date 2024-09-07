import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDividerWIthText extends StatelessWidget {
  final String text;
  const AppDividerWIthText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: '---------------------',
            style: AppTextStyles.tinyLabelTextStyle,
          ),
          AppText(
            text: text,
            style: AppTextStyles.tinyLabelTextStyle,
          ),
          AppText(
            text: '--------------------',
            style: AppTextStyles.tinyLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
