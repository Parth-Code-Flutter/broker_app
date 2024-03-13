import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final Widget child;
   AppContainer({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteBg,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 15,
              spreadRadius: 10),
        ],
      ),
      child:child ,
    );
  }
}
