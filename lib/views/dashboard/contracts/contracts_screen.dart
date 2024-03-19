import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/providers/contracts/contracts_provider.dart';
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
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ContractsScreen extends StatefulWidget {
  const ContractsScreen({super.key});

  @override
  State<ContractsScreen> createState() => _ContractsScreenState();
}

class _ContractsScreenState extends State<ContractsScreen> {
  TextEditingController _searchController = TextEditingController();

  final _controller = ScrollController();
  double firstTextWidth = 0.24;
  double secondTextWidth = 0.6;

  @override
  void initState() {
    getContractsData();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          if (context.read<ContractsProvider>().isListEmpty == false) {
            setState(() {});
            ;
            context.read<ContractsProvider>().setContractsData();
          }
        }
      }
    });
    super.initState();
  }

  getContractsData() {
    context.read<ContractsProvider>().setContractsData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: kContracts, isShowBackButton: true),
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
                        context.read<ContractsProvider>().isListEmpty = false;
                        context.read<ContractsProvider>().limit = 10;
                        context.read<ContractsProvider>().limit = 10;
                        context
                            .read<ContractsProvider>()
                            .setContractsData(searchText: '');
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

  Widget get _contractsList {
    return Consumer<ContractsProvider>(
      builder: (context, provider, child) {
        var isLoading = provider.isLoading;

        if (isLoading)
          return Expanded(
            child: AppLoader(),
          );

        return Expanded(
          child: ListView.builder(
            itemCount: provider.contracts.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              var contractData = provider.contracts[index];
              return Container(
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
                                    '${(contractData.vouType ?? '').trim()}-${contractData.vouTypeVou ?? 0}',
                                style: AppTextStyles.tinyListTextStyle
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        AppText(
                          text: AppDateTimeExtension.convertDDMMYYYY(
                              contractData.date ?? ''),
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
                            text: contractData.sellerName ?? '',
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
                            text: contractData.buyerName ?? '',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// Product Name
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kProductName,
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
                            text: (contractData.productName ?? '').trimLeft(),
                            style: AppTextStyles.tinyListTextStyle,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// qty & packing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: firstTextWidth.screenWidth,
                              child: AppText(
                                text: kQty,
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
                              child: AppText(
                                text: contractData.qty ?? '',
                                style: AppTextStyles.tinyListTextStyle,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: (firstTextWidth - 0.08).screenWidth,
                              child: AppText(
                                text: kPacking,
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
                              text: contractData.packaging ?? '',
                              style: AppTextStyles.tinyListTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    AppSpaces.v4,

                    /// Sauda Rate
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: kSaudaRate,
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
                            text: contractData.saudaRate ?? '',
                            style: AppTextStyles.tinyListTextStyle,
                          ),
                        ),
                      ],
                    ),

                    AppSpaces.v4,

                    // /// Remarks
                    // Row(
                    //   children: [
                    //     SizedBox(
                    //       width: firstTextWidth.screenWidth,
                    //       child: AppText(
                    //         text: kRemarks,
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
                    //         text: 'OverAll Good',
                    //         style: AppTextStyles.tinyListTextStyle,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // AppSpaces.v4,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 32,
                          width: 0.18.screenWidth,
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBg,
                            borderRadius: AppUIUtils.containerBorderRadius,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppAssets.pdfIcon),
                              AppSpaces.h4,
                              AppText(
                                text: kShare,
                                style: AppTextStyles.tinyLabelTextStyle
                                    .copyWith(
                                        color: AppColors.whiteText,
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        AppSpaces.h8,
                        Container(
                          height: 32,
                          width: 0.18.screenWidth,
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBg,
                            borderRadius: AppUIUtils.containerBorderRadius,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppAssets.pdfIcon),
                              AppSpaces.h4,
                              AppText(
                                text: kView,
                                style: AppTextStyles.tinyLabelTextStyle
                                    .copyWith(
                                        color: AppColors.whiteText,
                                        fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
