import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/providers/party_master/party_master_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/dialogs/app_dialogs.dart';
import 'package:broker_app/utils/extensions/app_date_time_extension.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_drop_down.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:broker_app/views/dashboard/broker_invoice/broker_invoice_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrokerInvoiceFilterScreen extends StatefulWidget {
  const BrokerInvoiceFilterScreen({super.key});

  @override
  State<BrokerInvoiceFilterScreen> createState() =>
      _BrokerInvoiceFilterScreenState();
}

class _BrokerInvoiceFilterScreenState extends State<BrokerInvoiceFilterScreen> {
  TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _controller = ScrollController();

  TextEditingController _dateFromController = TextEditingController();
  TextEditingController _dateToController = TextEditingController();

  DateTime dateFrom = DateTime.now().subtract(Duration(days: 1));
  DateTime dateTo = DateTime.now();
  String? _partyId;
  String? _voucherId;
  bool isShowPartyList = false;

  getData() async {
    await context.read<PartyMasterProvider>().setVoucherData();
  }

  @override
  void initState() {
    _dateFromController.text =
        DateTime.now().subtract(Duration(days: 1)).dateWithYear;
    _dateToController.text = DateTime.now().dateWithYear;

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: '$kBrokerInvoice $kFilter', isShowBackButton: true),
      body: InkWell(
        onTap: () {
          isShowPartyList = false;
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AppSpaces.v16,
                    _searchAndFilter,
                    AppSpaces.v16,
                    _dateFrom,
                    AppSpaces.v16,
                    _dateTo,
                    AppSpaces.v16,
                    _voucherDropdown,
                    AppSpaces.v16,
                    _buttons,
                  ],
                ),
              ),
              if (isShowPartyList)
                Container(
                  height: 0.4.screenHeight,
                  margin: EdgeInsets.symmetric(vertical: 76),
                  decoration: BoxDecoration(
                      color: AppColors.whiteBg,
                      border: Border.all(
                          color: AppColors.blackShade.withOpacity(0.5)),
                      borderRadius: AppUIUtils.containerBorderRadius),
                  child: _partyMasterList,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _searchAndFilter {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            //height: 40,
            child: AppTextField(
              controller: _searchController,
              hintText: kSearchFilterHint,
              labelText: '$kSearchFilterHint $kParty',
              // padding: EdgeInsets.symmetric(
              //   horizontal: 16,
              //   vertical: 8,
              // ),
              suffix: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () {
                    if (_searchController.text.trim().isNotEmpty) {
                      _partyId = '';
                      _searchController.text = '';
                      context.read<PartyMasterProvider>().clean();
                      // context.read<ContractsProvider>().isListEmpty = false;
                      // context.read<ContractsProvider>().offset = 10;
                      // context.read<ContractsProvider>().limit = 10;
                      // context.read<PartyMasterProvider>().setPartyData(
                      //       searchText: '',
                      //     );
                      FocusManager.instance.primaryFocus?.unfocus();
                      isShowPartyList = false;
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
              context.read<PartyMasterProvider>().clean();
              // context.read<ContractsProvider>().isListEmpty = false;
              // context.read<ContractsProvider>().offset = 10;
              // context.read<ContractsProvider>().limit = 10;
              context.read<PartyMasterProvider>().setPartyData(
                    searchText: _searchController.text.trim(),
                  );
              isShowPartyList = true;
              setState(() {});
            }
          },
          child: Container(
            height: 42,
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: AppUIUtils.primaryBorderRadius,
                border: Border.all(color: AppColors.primaryBg)),
            child: Icon(
              Icons.search,
              color: AppColors.primaryBg,
            ),
          ),
        ),
      ],
    );
  }

  Widget get _partyMasterList {
    return Consumer<PartyMasterProvider>(
      builder: (context, provider, child) {
        var isLoading = provider.isLoading;

        if (isLoading) return AppLoader();

        var partyList = provider.partyList;
        return partyList.isEmpty
            ? Center(
                child: AppText(text: 'No Data Found'),
              )
            : ListView.separated(
                controller: _controller,
                itemCount: partyList.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var data = partyList[index];
                  return GestureDetector(
                    onTap: () {
                      isShowPartyList = false;
                      _partyId = data.accVou;
                      _searchController.text = data.accNm ?? '';
                      print(_partyId);
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        // color: AppColors.containerBG,
                        borderRadius: AppUIUtils.containerBorderRadius,
                      ),
                      child: SizedBox(
                        width: 0.6.screenWidth,
                        child: AppText(
                          text: '${data.accNm ?? ''}',
                          style: AppTextStyles.tinyListTextStyle
                              .copyWith(fontWeight: FontWeight.w700),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(
                      thickness: 0.5,
                      height: 1,
                    ),
                  );
                },
              );
      },
    );
  }

  get _voucherDropdown {
    return Consumer<PartyMasterProvider>(
      builder: (context, provider, child) {
        bool isLoading = provider.isLoading;

        if (isLoading) return AppLoader();

        final data = provider.voucherList;
        return AppDropDown<String>(
          // fieldTitle: 'City/Village',
          // isRequired: true,
          hintText: kSelectVoucherType,
          labelText: kVoucherType,
          selectedItem: _voucherId,

          items: data.map((e) => e.id.toString() ?? '').toList(),
          string: (item) =>
              data
                  .where((company) => company.id.toString() == item)
                  .firstOrNull
                  ?.description ??
              '',
          onChanged: (value) {
            _voucherId = value;
            setState(() {});
            print('_voucherId :: $_voucherId');
          },
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please select Party';
          //   }
          //
          //   return null;
          // },
        );
      },
    );
  }

  get _dateFrom {
    return AppTextField(
      labelText: kDateFrom,
      controller: _dateFromController,
      readOnly: true,
      onTap: () {
        AppDialogs.selectDate(
          context: context,
          onSelected: (date) {
            if (date == null) return;
            dateFrom = date;

            _dateFromController.text = date.dateWithYear;
            setState(() {});
          },
          initialDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 365 * 100)),
          minDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
        );
      },
    );
  }

  get _dateTo {
    return AppTextField(
      labelText: kDateTo,
      controller: _dateToController,
      readOnly: true,
      onTap: () {
        AppDialogs.selectDate(
          context: context,
          onSelected: (date) {
            if (date == null) return;
            dateTo = date;
            _dateToController.text = date.dateWithYear;
            setState(() {});
          },
          initialDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 365 * 100)),
          minDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
        );
      },
    );
  }

  get _buttons {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: AppButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();

              final valid = _formKey.currentState?.validate() ?? false;

              if (!valid) return;

              NavHelper.navigate(
                context: context,
                screen: BrokerInvoiceScreen(
                  dateFrom: dateFrom,
                  dateTo: dateTo,
                  partyId: _partyId,
                  voucherId: _voucherId,
                ),
              );
            },
            text: kSubmit,
            borderRadius: AppUIUtils.buttonBorderRadius5,
            textStyle: AppTextStyles.dashboardText
                .copyWith(color: AppColors.whiteText),
          ),
        ),
        AppSpaces.h16,
        Flexible(
          flex: 1,
          child: AppButton(
            onPressed: () {
              NavHelper.pop(context);
            },
            text: kCancel,
            borderRadius: AppUIUtils.buttonBorderRadius5,
            color: AppColors.whiteBg,
            textStyle: AppTextStyles.dashboardText.copyWith(),
          ),
        ),
      ],
    );
  }
}
