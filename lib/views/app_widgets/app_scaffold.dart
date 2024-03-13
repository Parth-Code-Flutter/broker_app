import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/views/app_widgets/app_header.dart';
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
            AppHeader(),
            Padding(
              padding: EdgeInsets.only(
                top: 0.31.screenHeight,
              ),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
