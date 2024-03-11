import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.bgColor,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = false,
  });

  final Widget body;
  final Color? bgColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: appBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: bgColor ?? AppColors.primaryBg,
        drawer: drawer,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            body,
          ],
        ),
      ),
    );
  }
}
