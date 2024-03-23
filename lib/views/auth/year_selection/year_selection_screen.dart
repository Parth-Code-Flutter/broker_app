import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/providers/sign_in/sign_in_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_date_time_extension.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_container.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearSelectionScreen extends StatefulWidget {
  const YearSelectionScreen({super.key});

  @override
  State<YearSelectionScreen> createState() => _YearSelectionScreenState();
}

class _YearSelectionScreenState extends State<YearSelectionScreen> {
  @override
  void initState() {
    getYearsData();
    super.initState();
  }

  getYearsData() {
    context.read<SignInProvider>().setYearsData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isShowAppIcon: true,
      bgColor: AppColors.primaryBg,
      body: Consumer<SignInProvider>(
        builder: (context, provider, child) {
          bool isLoading = provider.isLoading;

          if (isLoading) return AppLoader();
          return Padding(
            padding: AppUIUtils.defaultHorizontalPadding,
            child: Column(
              children: [
                _title,
                AppSpaces.v16,
                AppContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: ListView.separated(
                      itemCount: provider.years.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            AppGlobals.instance.yearId =
                                provider.years[index].yearVou.toString();
                            AppGlobals.instance.selectedYear =
                                ((AppDateTimeExtension.convertServerDateToYYYY(
                                      (provider.years[index].startDt ?? ''),
                                    )) +
                                    (AppDateTimeExtension
                                        .convertServerDateToYYYY(
                                      (provider.years[index].endDt ?? ''),
                                    )));
                            AppGlobals.instance.selectedYear =  provider.years[index].cmpCode??'';
                            NavHelper.navigate(
                              context: context,
                              screen: DashboardScreen(),
                              removeAll: true,
                            );
                          },
                          child: Column(
                            children: [
                              AppSpaces.v8,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text:
                                        '${provider.years[index].cmpCode ?? ''} : ',
                                    style: AppTextStyles.bottomSheetTitle
                                        .copyWith(
                                            color: AppColors.blackShade,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  AppText(
                                    text: ((AppDateTimeExtension
                                            .convertServerDateToYY(
                                          (provider.years[index].startDt ?? ''),
                                        )) +
                                        '-' +
                                        (AppDateTimeExtension
                                            .convertServerDateToYY(
                                          (provider.years[index].endDt ?? ''),
                                        ))),
                                    style: AppTextStyles.bottomSheetTitle
                                        .copyWith(
                                            color: AppColors.blackShade,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              AppSpaces.v8,
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 1.screenWidth,
                          height: 0.8,
                          color: AppColors.blackShade,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget get _title {
    return AppText(
      text: 'Select Year',
      style: AppTextStyles.authTitle,
    );
  }
}
