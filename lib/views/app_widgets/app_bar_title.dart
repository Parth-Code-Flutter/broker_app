import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppText(
      text: title,
      style: AppTextStyles.appBarTitle,
    );
  }
}
