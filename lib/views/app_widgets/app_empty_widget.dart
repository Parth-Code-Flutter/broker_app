import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: text ?? AppStrings.nothingToShow,
        style: AppTextStyles.empty,
      ),
    );
  }
}
