import 'package:flutter/material.dart';

class BottomNavItem {
  BottomNavItem({
    required this.index,
    required this.name,
    required this.iconPath,
    required this.page,
  });

  final int index;
  final String name;
  final String iconPath;
  final Widget page;
}
