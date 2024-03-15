import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:broker_app/views/dashboard/loading/loading_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: kLoading, isShowBackButton: true),
      body: Column(
        children: [
          _searchAndFilter,
          AppSpaces.v8,
          _loadingList,
          AppSpaces.v8,
        ],
      ),
    );
  }

  Widget get _searchAndFilter {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 12),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: AppTextField(
                controller: _searchController,
                hintText: kSearchFilterHint,
                labelText: kSearchFilterHint,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // NavHelper.navigate(
              //   context: context,
              //   screen: PartyFilter(),
              // );
            },
            child: Container(
              height: 38,
              margin: EdgeInsets.symmetric(horizontal: 8),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.primaryBg,
                borderRadius: AppUIUtils.containerBorderRadius,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppAssets.filterIcon),
                  AppSpaces.h8,
                  AppText(
                    text: kFilter,
                    style: AppTextStyles.dashboardText
                        .copyWith(color: AppColors.whiteText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _loadingList {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => NavHelper.navigate(
              context: context,
              screen: LoadingDetailsScreen(),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.containerBG,
                borderRadius: AppUIUtils.containerBorderRadius,
              ),
              child: Column(
                children: [
                  /// type-vno and date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: '$kTypeVNo : ',
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                          AppText(
                            text: 'ABC-51',
                            style: AppTextStyles.tinyListTextStyle
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      AppText(
                        text: '07 Feb, 2024',
                        style: AppTextStyles.tinyLabelTextStyle
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  AppSpaces.v4,

                  /// seller
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: '$kSeller : ',
                        style: AppTextStyles.tinyLabelTextStyle,
                      ),
                      SizedBox(
                        width: 0.6.screenWidth,
                        child: AppText(
                          text: 'Mr. Mehta - Mumbai',
                          style: AppTextStyles.tinyListTextStyle,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  AppSpaces.v4,

                  /// buyer
                  Row(
                    children: [
                      AppText(
                        text: '$kBuyer : ',
                        style: AppTextStyles.tinyLabelTextStyle,
                      ),
                      AppText(
                        text: 'Bipin Patel - Delhi',
                        style: AppTextStyles.tinyListTextStyle,
                      ),
                    ],
                  ),
                  AppSpaces.v4,

                  /// contract no & date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: '$kContractNo : ',
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                          AppText(
                            text: '123',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AppText(
                            text: '$kContractDate : ',
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                          AppText(
                            text: '12 Jan, 2024',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSpaces.v4,

                  /// Product Name
                  Row(
                    children: [
                      AppText(
                        text: '$kProductName : ',
                        style: AppTextStyles.tinyLabelTextStyle,
                      ),
                      SizedBox(
                        width: 0.6.screenWidth,
                        child: AppText(
                          text: 'The Money Managers',
                          style: AppTextStyles.tinyListTextStyle,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  AppSpaces.v4,

                  /// Rate
                  Row(
                    children: [
                      AppText(
                        text: '$kRate : ',
                        style: AppTextStyles.tinyLabelTextStyle,
                      ),
                      SizedBox(
                        width: 0.6.screenWidth,
                        child: AppText(
                          text: '99999 quintal',
                          style: AppTextStyles.tinyListTextStyle,
                        ),
                      ),
                    ],
                  ),
                  AppSpaces.v4,

                  /// sauda qty & packing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: '$kSaudaQty : ',
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                          AppText(
                            text: '999.99 ton',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AppText(
                            text: '$kPendingQty : ',
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                          AppText(
                            text: '999.99 ton',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSpaces.v4,

                  /// Loading Qty
                  Row(
                    children: [
                      AppText(
                        text: '$kLoading $kQty : ',
                        style: AppTextStyles.tinyLabelTextStyle,
                      ),
                      AppText(
                        text: '999.99',
                        style: AppTextStyles.tinyListTextStyle,
                      ),
                    ],
                  ),

                  AppSpaces.v4,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
