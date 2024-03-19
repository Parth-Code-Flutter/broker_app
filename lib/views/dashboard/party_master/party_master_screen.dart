import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/helpers/launch_url/launch_url.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/models/party_master/party_master_data.dart';
import 'package:broker_app/providers/party_master/party_master_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:broker_app/views/dashboard/party_master/party_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PartyMasterScreen extends StatefulWidget {
  const PartyMasterScreen({super.key});

  @override
  State<PartyMasterScreen> createState() => _PartyMasterScreenState();
}

class _PartyMasterScreenState extends State<PartyMasterScreen> {
  TextEditingController _searchController = TextEditingController();
  final _controller = ScrollController();

  double firstTextWidth = 0.24;
  double secondTextWidth = 0.6;

  @override
  void initState() {
    context.read<PartyMasterProvider>().offset = 10;
    context.read<PartyMasterProvider>().limit = 10;
    getPartyData();

    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          if (context.read<PartyMasterProvider>().isListEmpty == false) {
            setState(() {});
            ;
            context.read<PartyMasterProvider>().setPartyData();
          }
        }
      }
    });
    super.initState();
  }

  getPartyData() {
    context.read<PartyMasterProvider>().setPartyData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: kPartyMaster, isShowBackButton: true),
      body: Column(
        children: [
          _searchAndFilter,
          AppSpaces.v8,
          _partyMasterList,
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
                  vertical: 9,
                ),
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      if (_searchController.text.trim().isNotEmpty) {
                        _searchController.text = '';
                        context.read<PartyMasterProvider>().isListEmpty = false;
                        context.read<PartyMasterProvider>().limit = 10;
                        context.read<PartyMasterProvider>().limit = 10;
                        context
                            .read<PartyMasterProvider>()
                            .setPartyData(searchText: '');
                        FocusManager.instance.primaryFocus?.unfocus();
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.close,
                        color: _searchController.text.trim().isEmpty
                            ? Colors.transparent
                            : AppColors.blackShade),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                  // if (value.trim().isNotEmpty) {
                  //   context
                  //       .read<PartyMasterProvider>()
                  //       .setPartyData(searchText: value);
                  //   setState(() {});
                  // } else {
                  //   context
                  //       .read<PartyMasterProvider>()
                  //       .setPartyData(searchText: '');
                  //   setState(() {});
                  // }
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_searchController.text.trim().isNotEmpty) {
                FocusManager.instance.primaryFocus?.unfocus();
                context.read<PartyMasterProvider>().isListEmpty = false;
                context.read<PartyMasterProvider>().limit = 10;
                context.read<PartyMasterProvider>().limit = 10;
                context.read<PartyMasterProvider>().setPartyData(
                      searchText: _searchController.text.trim(),
                    );
                setState(() {});
              }
            },
            child: Container(
              height: 38,
              margin: EdgeInsets.symmetric(horizontal: 4),
              padding: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                  borderRadius: AppUIUtils.primaryBorderRadius,
                  border: Border.all(color: AppColors.primaryBg)),
              child: Icon(
                Icons.search,
                color: AppColors.primaryBg,
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     NavHelper.navigate(
          //       context: context,
          //       screen: PartyFilter(),
          //     );
          //   },
          //   child: Container(
          //     height: 38,
          //     margin: EdgeInsets.symmetric(horizontal: 8),
          //     padding: EdgeInsets.symmetric(horizontal: 12),
          //     decoration: BoxDecoration(
          //       color: AppColors.primaryBg,
          //       borderRadius: AppUIUtils.containerBorderRadius,
          //     ),
          //     child: Row(
          //       children: [
          //         SvgPicture.asset(AppAssets.filterIcon),
          //         AppSpaces.h8,
          //         AppText(
          //           text: kFilter,
          //           style: AppTextStyles.dashboardText
          //               .copyWith(color: AppColors.whiteText),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget get _partyMasterList {
    return Consumer<PartyMasterProvider>(
      builder: (context, provider, child) {
        var isLoading = provider.isLoading;

        if (isLoading)
          return Expanded(
            child: AppLoader(),
          );
        var partyList = provider.partyList;
        return Expanded(
          child: ListView.builder(
            controller: _controller,
            itemCount: partyList.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              var data = partyList[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.containerBG,
                  borderRadius: AppUIUtils.containerBorderRadius,
                ),
                child: Column(
                  children: [
                    /// name and date
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kName,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          child: AppText(
                            text: ': ',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                        SizedBox(
                          // width: 0.6.screenWidth,
                          width: secondTextWidth.screenWidth,
                          child: AppText(
                            text: '${data.accNm ?? ''}',
                            style: AppTextStyles.tinyListTextStyle
                                .copyWith(fontWeight: FontWeight.w700),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,
                    // AppText(
                    //   text: '07 Feb, 2024',
                    //   style: AppTextStyles.tinyLabelTextStyle
                    //       .copyWith(fontWeight: FontWeight.w400),
                    // ),
                    /// city & state
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: '$kCity-$kState',
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: secondTextWidth.screenWidth,
                          child: AppText(
                            text: ': ${returnCityState(data)}',
                            style: AppTextStyles.tinyListTextStyle,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// phone office
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kPhoneOffice,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            LaunchUrlHelper.launchUrlMethod(
                                Uri.parse('tel:${data.accCPerMob ?? ''}'));
                          },
                          child: SizedBox(
                            width: secondTextWidth.screenWidth,
                            child: AppText(
                              text: ': ${data.accPhone ?? ''}',
                              style: AppTextStyles.tinyListTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// cont. person
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kContPerson,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: secondTextWidth.screenWidth,
                          child: AppText(
                            text: ': ${data.accCper ?? ''}',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// mobile no1
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kMobileNo,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            LaunchUrlHelper.launchUrlMethod(
                                Uri.parse('tel:${data.accMob ?? ''}'));
                          },
                          child: SizedBox(
                            width: secondTextWidth.screenWidth,
                            child: AppText(
                              text: ': ${data.accMob ?? ''}',
                              style: AppTextStyles.tinyListTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    // /// mobile no2
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: firstTextWidth.screenWidth,
                    //       child: AppText(
                    //         text: kMobileNo2,
                    //         style: AppTextStyles.tinyLabelTextStyle,
                    //       ),
                    //     ),
                    //     GestureDetector(
                    //       onTap: () {
                    //         LaunchUrlHelper.launchUrlMethod(
                    //             Uri.parse('tel:${data.accMob ?? ''}'));
                    //       },
                    //       child: SizedBox(
                    //         width: secondTextWidth.screenWidth,
                    //         child: AppText(
                    //           text: ': ${data.accMob ?? ''}',
                    //           style: AppTextStyles.tinyListTextStyle,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // AppSpaces.v4,

                    /// email-Id
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kEmailID,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: secondTextWidth.screenWidth,
                          child: AppText(
                            text: ': ${data.accEml ?? ''}',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// gst
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kGSTNo,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          child: AppText(
                            text: ': ',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                        AppText(
                          text: '${data.accGST ?? ''}',
                          style: AppTextStyles.tinyListTextStyle
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),

                    AppSpaces.v4,

                    /// pan
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kPanNo,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          child: AppText(
                            text: ': ',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                        AppText(
                          text: '${data.accPAN ?? ''}',
                          style: AppTextStyles.tinyListTextStyle
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// Address
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kAddress,
                            style: AppTextStyles.tinyLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          child: AppText(
                            text: ': ',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 0.6.screenWidth,
                          child: AppText(
                            text:
                                '${data.accAdd ?? ''}, ${returnCityState(data)}',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    // Align(
                    //   alignment: Alignment.bottomRight,
                    //   child: Container(
                    //     height: 32,
                    //     width: 0.18.screenWidth,
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    //     decoration: BoxDecoration(
                    //       color: AppColors.primaryBg,
                    //       borderRadius: AppUIUtils.containerBorderRadius,
                    //     ),
                    //     child: Row(
                    //       children: [
                    //         SvgPicture.asset(AppAssets.pdfIcon),
                    //         AppSpaces.h4,
                    //         AppText(
                    //           text: kShare,
                    //           style: AppTextStyles.tinyLabelTextStyle.copyWith(
                    //               color: AppColors.whiteText,
                    //               fontWeight: FontWeight.w600),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  returnCityState(PartyMasterData data) {
    String city = data.accCtyName ?? '';
    String state = data.accState ?? '';

    if (city.isEmpty) {
      return state;
    } else {
      return city + state;
    }
  }
}
