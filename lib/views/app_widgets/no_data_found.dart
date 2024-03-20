import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: AppText(text: 'No Data Found'),
      ),
    );
  }
}
