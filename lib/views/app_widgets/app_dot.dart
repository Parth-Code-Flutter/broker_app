import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppDot extends StatelessWidget {
  const AppDot({
    this.size = 8,
    this.color,
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
  });

  final double size;
  final Color? color;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.darkGreyText,
        shape: BoxShape.circle,
      ),
      height: size,
      width: size,
      margin: margin,
    );
  }
}
