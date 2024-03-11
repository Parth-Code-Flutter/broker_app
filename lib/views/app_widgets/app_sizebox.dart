import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:flutter/cupertino.dart';

class AppSizeBox extends StatelessWidget {
  const AppSizeBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.50.screenWidth,
      height: 0.038.screenHeight,
      child: child,
    );
  }
}
