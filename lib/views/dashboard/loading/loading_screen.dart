import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/providers/loading/loading_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_date_time_extension.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/no_data_found.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:broker_app/views/dashboard/loading/loading_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  final DateTime dateFrom;
  final DateTime dateTo;
  final String? partyId;

  const LoadingScreen(
      {super.key,
      required this.dateFrom,
      required this.dateTo,
      required this.partyId});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  TextEditingController _searchController = TextEditingController();

  final _controller = ScrollController();
  double firstTextWidth = 0.24;
  double secondTextWidth = 0.6;

  @override
  void initState() {
    context.read<LoadingProvider>().clean();
    // context.read<LoadingProvider>().offset = 10;
    // context.read<LoadingProvider>().limit = 10;
    getLoadingData();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          if (context.read<LoadingProvider>().isListEmpty == false) {
            // setState(() {});
            context.read<LoadingProvider>().setLoadingsData();
          }
        }
      }
    });
    super.initState();
  }

  getLoadingData() {
    print('widget.dateTo :: ${widget.dateTo}');
    context.read<LoadingProvider>().setLoadingsData(
          dateTo: widget.dateTo.dateForDB,
          dateFrom: widget.dateFrom.dateForDB,
          partyId: widget.partyId ?? '',
        );
  }

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
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: GestureDetector(
                    onTap: () {
                      if (_searchController.text.trim().isNotEmpty) {
                        _searchController.text = '';
                        context.read<LoadingProvider>().clean();
                        // context.read<LoadingProvider>().isListEmpty = false;
                        // context.read<LoadingProvider>().offset = 10;
                        // context.read<LoadingProvider>().limit = 10;
                        context.read<LoadingProvider>().setLoadingsData(
                              searchText: '',
                              dateTo: widget.dateTo.dateForDB,
                              dateFrom: widget.dateFrom.dateForDB,
                              partyId: widget.partyId ?? '',
                            );
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
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_searchController.text.trim().isNotEmpty) {
                FocusManager.instance.primaryFocus?.unfocus();
                context.read<LoadingProvider>().clean();
                // context.read<LoadingProvider>().isListEmpty = false;
                // context.read<LoadingProvider>().offset = 10;
                // context.read<LoadingProvider>().limit = 10;
                context.read<LoadingProvider>().setLoadingsData(
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
          //       screen: ContractsFilterScreen(),
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

  Widget get _loadingList {
    return Consumer<LoadingProvider>(
      builder: (context, provider, child) {
        var isLoading = provider.isLoading;

        if (isLoading)
          return Expanded(
            child: AppLoader(),
          );

        var loadingList = provider.loadings;
        return loadingList.isEmpty
            ? NoDataFound()
            : Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: loadingList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var data = loadingList[index];
                    return GestureDetector(
                      onTap: () => NavHelper.navigate(
                        context: context,
                        screen: LoadingDetailsScreen(loadingData: data),
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                                    SizedBox(
                                      width: firstTextWidth.screenWidth,
                                      child: AppText(
                                        text: kTypeVNo,
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
                                      width:
                                          (secondTextWidth - 0.15).screenWidth,
                                      child: AppText(
                                        text: data.vNo.toString(),
                                        style: AppTextStyles.tinyListTextStyle
                                            .copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                                AppText(
                                  text: AppDateTimeExtension.convertDDMMYYYY(
                                      data.date ?? ''),
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
                                SizedBox(
                                  width: firstTextWidth.screenWidth,
                                  child: AppText(
                                    text: kSeller,
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
                                    text: data.sellerName,
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
                                SizedBox(
                                  width: firstTextWidth.screenWidth,
                                  child: AppText(
                                    text: kBuyer,
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
                                  width: secondTextWidth.screenWidth,
                                  child: AppText(
                                    text: data.buyerName ?? '',
                                    style: AppTextStyles.tinyListTextStyle,
                                  ),
                                ),
                              ],
                            ),
                            AppSpaces.v4,

                            /// contract no
                            Row(
                              children: [
                                SizedBox(
                                  width: firstTextWidth.screenWidth,
                                  child: AppText(
                                    text: kContractNo,
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
                                  width: secondTextWidth.screenWidth,
                                  child: AppText(
                                    text: data.contractNo.toString(),
                                    style: AppTextStyles.tinyListTextStyle,
                                  ),
                                ),
                              ],
                            ),
                            AppSpaces.v4,

                            /// contract date
                            Row(
                              children: [
                                SizedBox(
                                  width: firstTextWidth.screenWidth,
                                  child: AppText(
                                    text: kContractDate,
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
                                  width: secondTextWidth.screenWidth,
                                  child: AppText(
                                    text: AppDateTimeExtension.convertDDMMYYYY(
                                        data.contractDate ?? ''),
                                    style: AppTextStyles.tinyListTextStyle,
                                  ),
                                ),
                              ],
                            ),
                            AppSpaces.v4,

                            // /// Product Name
                            // Row(
                            //   children: [
                            //     SizedBox(
                            //       width: firstTextWidth.screenWidth,
                            //       child: AppText(
                            //         text: kProductName,
                            //         style: AppTextStyles.tinyLabelTextStyle,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       child: AppText(
                            //         text: ': ',
                            //         style: AppTextStyles.tinyListTextStyle,
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       width: 0.6.screenWidth,
                            //       child: AppText(
                            //         text: 'The Money Managers',
                            //         style: AppTextStyles.tinyListTextStyle,
                            //         maxLines: 2,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // AppSpaces.v4,

                            /// Rate
                            Row(
                              children: [
                                SizedBox(
                                  width: firstTextWidth.screenWidth,
                                  child: AppText(
                                    text: kRate,
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
                                    text: data.rate.toString(),
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
                                    SizedBox(
                                      width: firstTextWidth.screenWidth,
                                      child: AppText(
                                        text: kSaudaQty,
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
                                      text: data.saudaQty.toString(),
                                      style: AppTextStyles.tinyListTextStyle,
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     AppText(
                                //       text: kPendingQty,
                                //       style: AppTextStyles.tinyLabelTextStyle,
                                //     ),
                                //     SizedBox(
                                //       child: AppText(
                                //         text: ': ',
                                //         style: AppTextStyles.tinyListTextStyle,
                                //       ),
                                //     ),
                                //     AppText(
                                //       text: '999.99 ton',
                                //       style: AppTextStyles.tinyListTextStyle,
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                            AppSpaces.v4,

                            /// Loading Qty
                            Row(
                              children: [
                                SizedBox(
                                  width: firstTextWidth.screenWidth,
                                  child: AppText(
                                    text: '$kLoading $kQty',
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
                                  text: data.loadQty,
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
      },
    );
  }
}
