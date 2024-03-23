import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/models/loading_payment/loading_payment_data.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_date_time_extension.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/cupertino.dart';

class LoadingPaymentDetailsScreen extends StatefulWidget {
  final LoadingPaymentData loadingData;

  const LoadingPaymentDetailsScreen({super.key, required this.loadingData});

  @override
  State<LoadingPaymentDetailsScreen> createState() =>
      _LoadingPaymentDetailsScreenState();
}

class _LoadingPaymentDetailsScreenState
    extends State<LoadingPaymentDetailsScreen> {
  LoadingPaymentData? loadingData;
  double firstTextWidth = 0.26;
  double secondTextWidth = 0.6;

  @override
  void initState() {
    loadingData = widget.loadingData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: kLoadingPaymentDetails, isShowBackButton: true),
      body: Column(
        children: [
          AppSpaces.v8,
          Container(
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
                            text: kVNo,
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
                          text: loadingData?.vNo ?? '',
                          style: AppTextStyles.tinyListTextStyle
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    AppText(
                      text: AppDateTimeExtension.convertDDMMYYYY(
                          loadingData?.date ?? ''),
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
                      width: secondTextWidth.screenWidth,
                      child: AppText(
                        text: loadingData?.sellerName ?? '',
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
                    AppText(
                      text: loadingData?.buyerName ?? '',
                      style: AppTextStyles.tinyListTextStyle,
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
                        text: '$kContractNo : ',
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
                      text: (loadingData?.contractNo ?? 0).toString(),
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),

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
                            loadingData?.contractDate ?? ''),
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
                //       width: secondTextWidth.screenWidth,
                //       child: AppText(
                //         text: loadingData?.,
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
                      width: secondTextWidth.screenWidth,
                      child: AppText(
                        text: (loadingData?.rate ?? 0).toString(),
                        style: AppTextStyles.tinyListTextStyle,
                      ),
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// sauda qty
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
                          text: (loadingData?.saudaQty ?? 0).toString(),
                          style: AppTextStyles.tinyListTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// pending
                Row(
                  children: [
                    SizedBox(
                      width: firstTextWidth.screenWidth,
                      child: AppText(
                        text: kPendingQty,
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
                      text: loadingData?.pendingQty ?? '',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
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
                      text: loadingData?.loadQty ?? '',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// Amount
                Row(
                  children: [
                    SizedBox(
                      width: firstTextWidth.screenWidth,
                      child: AppText(
                        text: kAmount,
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
                      text: loadingData?.amount ?? '',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// Other Charges
                Row(
                  children: [
                    SizedBox(
                      width: firstTextWidth.screenWidth,
                      child: AppText(
                        text: kOtherCharges,
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
                      text: (loadingData?.otherAmount ?? 0).toString(),
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// Bill No & Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: '$kBillNo.',
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
                          text: loadingData?.billNo ?? '',
                          style: AppTextStyles.tinyListTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: (firstTextWidth - 0.08).screenWidth,
                          child: AppText(
                            text: '$kBillDate.',
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
                          text: AppDateTimeExtension.convertDDMMYYYY(
                              loadingData?.billDate ?? ''),
                          style: AppTextStyles.tinyListTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                AppSpaces.v4,

                // /// seller bill name
                // Row(
                //   children: [
                //     SizedBox(
                //       width: firstTextWidth.screenWidth,
                //       child: AppText(
                //         text: kSellerBillName,
                //         style: AppTextStyles.tinyLabelTextStyle,
                //       ),
                //     ),
                //     SizedBox(
                //       child: AppText(
                //         text: ': ',
                //         style: AppTextStyles.tinyListTextStyle,
                //       ),
                //     ),
                //     AppText(
                //       text: loadingData?.sellerBillName ?? '',
                //       style: AppTextStyles.tinyListTextStyle,
                //     ),
                //   ],
                // ),
                // AppSpaces.v4,
                //
                // /// buyer bill name
                // Row(
                //   children: [
                //     SizedBox(
                //       width: firstTextWidth.screenWidth,
                //       child: AppText(
                //         text: kBuyerBillName,
                //         style: AppTextStyles.tinyLabelTextStyle,
                //       ),
                //     ),
                //     SizedBox(
                //       child: AppText(
                //         text: ': ',
                //         style: AppTextStyles.tinyListTextStyle,
                //       ),
                //     ),
                //     AppText(
                //       text: loadingData?.buyerBillName ?? '',
                //       style: AppTextStyles.tinyListTextStyle,
                //     ),
                //   ],
                // ),
                // AppSpaces.v4,

                /// truck no.
                Row(
                  children: [
                    SizedBox(
                      width: firstTextWidth.screenWidth,
                      child: AppText(
                        text: kTruckNo,
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
                      text: loadingData?.truckNo ?? '',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                // /// remarks
                // Row(
                //   children: [
                //     AppText(
                //       text: '$kRemarks : ',
                //       style: AppTextStyles.tinyLabelTextStyle,
                //     ),
                //     AppText(
                //       text: 'Remarks',
                //       style: AppTextStyles.tinyListTextStyle,
                //     ),
                //   ],
                // ),
                // AppSpaces.v4,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
