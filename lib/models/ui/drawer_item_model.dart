import 'package:flutter/material.dart';

class DrawerItem {
  DrawerItem({
    required this.index,
    required this.name,
    this.page,
    this.iconPath,
  });

  final int index;
  final String name;
  final String? iconPath;
  final Widget? page;
}
