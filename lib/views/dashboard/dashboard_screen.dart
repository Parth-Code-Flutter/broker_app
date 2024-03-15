import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/models/dashboard/dashbaord_data.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_container.dart';
import 'package:broker_app/views/app_widgets/app_image.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 16),
        child: Wrap(
          children: _dashboardWidget,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 0,
          runSpacing: 0,
        ),
      ),
    );
  }

  List<Widget> get _dashboardWidget {
    List<Widget> widgets = [];
    for (int i = 0; i < DashboardData.dashboardDataList.length; i++) {
      widgets.add(
        GestureDetector(
          onTap: () {
            if (DashboardData.dashboardDataList[i].navigateTo != null) {
              NavHelper.navigate(
                  context: context,
                  screen: DashboardData.dashboardDataList[i].navigateTo!);
            }
          },
          child: SizedBox(
            width: 0.32.screenWidth,
            height: 0.194.screenHeight,
            child: Container(
              margin: EdgeInsets.only(right: 10, top: 10),
              decoration: BoxDecoration(
                color: AppColors.whiteBg,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    blurRadius: 10,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppImage.asset(
                          path: DashboardData.dashboardDataList[i].imgPath,
                          height: 0.06.screenHeight,
                        ),
                        AppSpaces.v2,
                        SizedBox(
                          width: 0.2.screenWidth,
                          child: AppText(
                            text: DashboardData.dashboardDataList[i].title,
                            maxLines: 2,
                            style: AppTextStyles.dashboardText,
                            align: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryBg,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: SvgPicture.asset(AppAssets.forwardArrowIcon,
                          height: 8, width: 8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return widgets;
  }
}
