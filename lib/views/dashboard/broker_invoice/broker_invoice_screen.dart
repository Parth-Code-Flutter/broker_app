import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/models/broker_invoice/broker_invoice_data.dart';
import 'package:broker_app/providers/broker_invoice/broker_invoice_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_date_time_extension.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/utils/urls/api_urls.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/app_view_pdf.dart';
import 'package:broker_app/views/app_widgets/no_data_found.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class BrokerInvoiceScreen extends StatefulWidget {
  final DateTime dateFrom;
  final DateTime dateTo;
  final String? partyId;
  final String? voucherId;

  const BrokerInvoiceScreen({
    super.key,
    required this.dateFrom,
    required this.dateTo,
    required this.partyId,
    required this.voucherId,
  });

  @override
  State<BrokerInvoiceScreen> createState() => _BrokerInvoiceScreenState();
}

class _BrokerInvoiceScreenState extends State<BrokerInvoiceScreen> {
  TextEditingController _searchController = TextEditingController();
  bool isShowLoader = false;

  final _controller = ScrollController();
  double firstTextWidth = 0.28;
  double secondTextWidth = 0.6;

  @override
  void initState() {
    context.read<BrokerInvoiceProvider>().clean();
    // context.read<ContractsProvider>().offset = 10;
    // context.read<ContractsProvider>().limit = 10;
    getBrokerInvoicesData();
    _controller.addListener(() async {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          isShowLoader = true;
          setState(() {});
          if (context.read<BrokerInvoiceProvider>().isListEmpty == false) {
            // setState(() {});
            await context.read<BrokerInvoiceProvider>().setBrokerInvoiceData(
                  dateTo: widget.dateTo.dateForDB,
                  dateFrom: widget.dateFrom.dateForDB,
                  partyId: widget.partyId ?? '',
                  voucherTypeId: widget.voucherId ?? '',
                );
          }
          isShowLoader = false;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  getBrokerInvoicesData() {
    print('widget.voucherId :: ${widget.voucherId}');
    context.read<BrokerInvoiceProvider>().setBrokerInvoiceData(
          dateTo: widget.dateTo.dateForDB,
          dateFrom: widget.dateFrom.dateForDB,
          partyId: widget.partyId ?? '',
          voucherTypeId: widget.voucherId ?? '',
        );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: kBrokerInvoice, isShowBackButton: true),
      body: Column(
        children: [
          _searchAndFilter,
          AppSpaces.v8,
          _brokersList,
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
                        context.read<BrokerInvoiceProvider>().clean();
                        // context.read<ContractsProvider>().isListEmpty = false;
                        // context.read<ContractsProvider>().offset = 10;
                        // context.read<ContractsProvider>().limit = 10;
                        context
                            .read<BrokerInvoiceProvider>()
                            .setBrokerInvoiceData(
                              searchText: '',
                              dateTo: widget.dateTo.dateForDB,
                              dateFrom: widget.dateFrom.dateForDB,
                              partyId: widget.partyId ?? '',
                              voucherTypeId: widget.voucherId ?? '',
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
                context.read<BrokerInvoiceProvider>().clean();
                // context.read<ContractsProvider>().isListEmpty = false;
                // context.read<ContractsProvider>().offset = 10;
                // context.read<ContractsProvider>().limit = 10;
                context.read<BrokerInvoiceProvider>().setBrokerInvoiceData(
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

  Widget get _brokersList {
    return Consumer<BrokerInvoiceProvider>(
      builder: (context, provider, child) {
        var isLoading = provider.isLoading;

        if (isLoading)
          return Expanded(
            child: AppLoader(),
          );

        var invoicessList = provider.brokerInvoices;
        return invoicessList.isEmpty
            ? NoDataFound()
            : Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        controller: _controller,
                        itemCount: invoicessList.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          var data = invoicessList[index];
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.containerBG,
                              borderRadius: AppUIUtils.containerBorderRadius,
                            ),
                            child: Column(
                              children: [
                                /// Company name
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: firstTextWidth.screenWidth,
                                      child: AppText(
                                        text: kCompanyName,
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
                                        text: data.companyName ?? '',
                                        style: AppTextStyles.tinyListTextStyle,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                AppSpaces.v4,

                                /// bill-no and date
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: firstTextWidth.screenWidth,
                                          child: AppText(
                                            text: kBillNo,
                                            style: AppTextStyles
                                                .tinyLabelTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          child: AppText(
                                            text: ': ',
                                            style:
                                                AppTextStyles.tinyListTextStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: (secondTextWidth - 0.2)
                                              .screenWidth,
                                          child: AppText(
                                            text:
                                                '${(data.invType ?? '').trim()}-${data.invVNo ?? 0}',
                                            style: AppTextStyles
                                                .tinyListTextStyle
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    ),
                                    AppText(
                                      text:
                                          AppDateTimeExtension.convertDDMMYYYY(
                                              data.invDate ?? ''),
                                      style: AppTextStyles.tinyLabelTextStyle
                                          .copyWith(
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                AppSpaces.v4,

                                /// party name
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: firstTextWidth.screenWidth,
                                      child: AppText(
                                        text: kPartyName,
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
                                        text: data.accNm ?? '',
                                        style: AppTextStyles.tinyListTextStyle,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                AppSpaces.v4,

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

                                /// contracts no
                                // Row(
                                //   children: [
                                //     SizedBox(
                                //       width: firstTextWidth.screenWidth,
                                //       child: AppText(
                                //         text: kContractNo,
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
                                //       width: secondTextWidth.screenWidth,
                                //       child: AppText(
                                //         text: data.invAccVou ?? '',
                                //         style: AppTextStyles.tinyListTextStyle,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                // AppSpaces.v4,

                                /// Bill Amount
                                Row(
                                  children: [
                                    SizedBox(
                                      width: firstTextWidth.screenWidth,
                                      child: AppText(
                                        text: kBillAmount,
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
                                        text: (data.invTotal ?? ''),
                                        style: AppTextStyles.tinyListTextStyle,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                                AppSpaces.v4,

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        String fileName = data.invFileNm ?? '';
                                        String url =
                                            '${APIUrls.pdfUrl}/$fileName.pdf';
                                        String filePath = url;
                                        NavHelper.navigate(
                                          context: context,
                                          screen:
                                              AppViewPdf(filePath: filePath),
                                        );
                                      },
                                      child: Container(
                                        height: 32,
                                        width: 0.18.screenWidth,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryBg,
                                          borderRadius:
                                              AppUIUtils.containerBorderRadius,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(AppAssets.pdfIcon),
                                            AppSpaces.h4,
                                            AppText(
                                              text: kView,
                                              style: AppTextStyles
                                                  .tinyLabelTextStyle
                                                  .copyWith(
                                                      color:
                                                          AppColors.whiteText,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // AppSpaces.h8,
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     String fileName = data.invFileNm ?? '';
                                    //     String url =
                                    //         '${APIUrls.pdfUrl}/$fileName.pdf';
                                    //     String filePath = url;
                                    //     Share.shareUri(
                                    //       Uri.parse(filePath),
                                    //     );
                                    //   },
                                    //   child: Container(
                                    //     height: 32,
                                    //     width: 0.18.screenWidth,
                                    //     padding: EdgeInsets.symmetric(
                                    //         horizontal: 6, vertical: 2),
                                    //     decoration: BoxDecoration(
                                    //       color: AppColors.primaryBg,
                                    //       borderRadius:
                                    //       AppUIUtils.containerBorderRadius,
                                    //     ),
                                    //     child: Row(
                                    //       children: [
                                    //         SvgPicture.asset(AppAssets.pdfIcon),
                                    //         AppSpaces.h4,
                                    //         AppText(
                                    //           text: kShare,
                                    //           style: AppTextStyles
                                    //               .tinyLabelTextStyle
                                    //               .copyWith(
                                    //               color:
                                    //               AppColors.whiteText,
                                    //               fontWeight:
                                    //               FontWeight.w600),
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    if (isShowLoader) AppLoader(),
                  ],
                ),
              );
      },
    );
  }

  returnCityState(BrokerInvoiceData data) {
    String city = data.ctyNm ?? '';
    String state = data.ctyState ?? '';
    // (data.accState ?? '').isNotEmpty
    //     ? data.accState ?? ''
    //     : data.state ?? '';

    if (city.isEmpty) {
      return state;
    } else if (state.isNotEmpty) {
      return city + ', $state';
    } else {
      return city;
    }
  }
}
