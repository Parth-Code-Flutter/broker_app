import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/providers/broker_invoice/broker_invoice_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_date_time_extension.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/no_data_found.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  final _controller = ScrollController();
  double firstTextWidth = 0.24;
  double secondTextWidth = 0.6;

  @override
  void initState() {
    context.read<BrokerInvoiceProvider>().clean();
    // context.read<ContractsProvider>().offset = 10;
    // context.read<ContractsProvider>().limit = 10;
    getContractsData();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          if (context.read<BrokerInvoiceProvider>().isListEmpty == false) {
            // setState(() {});
            context.read<BrokerInvoiceProvider>().setBrokerInvoiceData();
          }
        }
      }
    });
    super.initState();
  }

  getContractsData() {
    print('widget.dateTo :: ${widget.dateTo}');
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
          _contractsList,
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

  Widget get _contractsList {
    return Consumer<BrokerInvoiceProvider>(
      builder: (context, provider, child) {
        var isLoading = provider.isLoading;

        if (isLoading)
          return Expanded(
            child: AppLoader(),
          );

        var contractsList = provider.brokerInvoices;
        return contractsList.isEmpty
            ? NoDataFound()
            : Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: contractsList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var contractData = contractsList[index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.containerBG,
                        borderRadius: AppUIUtils.containerBorderRadius,
                      ),
                      child: Column(
                        children: [
                          /// bill-no and date
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
                                    width: (secondTextWidth - 0.2).screenWidth,
                                    child: AppText(
                                      text:
                                          '${(contractData.invType ?? '').trim()}-${contractData.invVNo ?? 0}',
                                      style: AppTextStyles.tinyListTextStyle
                                          .copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                              AppText(
                                text: AppDateTimeExtension.convertDDMMYYYY(
                                    contractData.invDate ?? ''),
                                style: AppTextStyles.tinyLabelTextStyle
                                    .copyWith(fontWeight: FontWeight.w400),
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
                                  text: contractData.accNm ?? '',
                                  style: AppTextStyles.tinyListTextStyle,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          AppSpaces.v4,

                          /// contracts no
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
                                  text: contractData.invAccVou ?? '',
                                  style: AppTextStyles.tinyListTextStyle,
                                ),
                              ),
                            ],
                          ),
                          AppSpaces.v4,

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
                                  text: (contractData.invTotal ?? ''),
                                  style: AppTextStyles.tinyListTextStyle,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          AppSpaces.v4,

                        ],
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
