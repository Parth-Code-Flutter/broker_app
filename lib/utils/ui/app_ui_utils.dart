import 'package:flutter/material.dart';

class AppUIUtils {
  static double get primaryRadius => 8;
  static BorderRadius get primaryBorderRadius =>
      BorderRadius.circular(primaryRadius);

  static BorderRadius get containerBorderRadius =>
      BorderRadius.circular(4);
  static BorderRadius get circleRadius => BorderRadius.circular(100);

  static BorderRadius get bottomNavBarRadius => BorderRadius.circular(0);

  static BorderRadius get homeBorderRadius => BorderRadius.circular(20);
  static BorderRadius get buttonBorderRadius => BorderRadius.circular(48);
  static BorderRadius get buttonBorderRadius5 => BorderRadius.circular(5);

  static double get productHeight => 170;

  static double get homeIconSize => 36;
  static double get homeScreenCardHeight => 120;

  static EdgeInsets get defaultHorizontalPadding => EdgeInsets.symmetric(horizontal: 16);
}
