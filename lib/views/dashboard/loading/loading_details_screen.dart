import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/cupertino.dart';

class LoadingDetailsScreen extends StatefulWidget {
  const LoadingDetailsScreen({super.key});

  @override
  State<LoadingDetailsScreen> createState() => _LoadingDetailsScreenState();
}

class _LoadingDetailsScreenState extends State<LoadingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: kLoadingDetails, isShowBackButton: true),
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

                /// Amount
                Row(
                  children: [
                    AppText(
                      text: '$kAmount : ',
                      style: AppTextStyles.tinyLabelTextStyle,
                    ),
                    AppText(
                      text: '999.99',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// Other Charges
                Row(
                  children: [
                    AppText(
                      text: '$kOtherCharges : ',
                      style: AppTextStyles.tinyLabelTextStyle,
                    ),
                    AppText(
                      text: '999.99',
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
                        AppText(
                          text: '$kBillNo. : ',
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
                          text: '$kBillDate. : ',
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

                /// seller bill name
                Row(
                  children: [
                    AppText(
                      text: '$kSellerBillName : ',
                      style: AppTextStyles.tinyLabelTextStyle,
                    ),
                    AppText(
                      text: 'Mr. Mehta - Mumbai',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// buyer bill name
                Row(
                  children: [
                    AppText(
                      text: '$kBuyerBillName : ',
                      style: AppTextStyles.tinyLabelTextStyle,
                    ),
                    AppText(
                      text: 'Bipin Patel - Delhi',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// truck no.
                Row(
                  children: [
                    AppText(
                      text: '$kTruckNo : ',
                      style: AppTextStyles.tinyLabelTextStyle,
                    ),
                    AppText(
                      text: 'GJ03AJ9898',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,

                /// remarks
                Row(
                  children: [
                    AppText(
                      text: '$kRemarks : ',
                      style: AppTextStyles.tinyLabelTextStyle,
                    ),
                    AppText(
                      text: 'Remarks',
                      style: AppTextStyles.tinyListTextStyle,
                    ),
                  ],
                ),
                AppSpaces.v4,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
