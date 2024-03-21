import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/providers/party_master/party_master_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/dialogs/app_dialogs.dart';
import 'package:broker_app/utils/extensions/app_date_time_extension.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_drop_down.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:broker_app/views/dashboard/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingFilterScreen extends StatefulWidget {
  const LoadingFilterScreen({super.key});

  @override
  State<LoadingFilterScreen> createState() => _LoadingFilterScreenState();
}

class _LoadingFilterScreenState extends State<LoadingFilterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _dateFromController = TextEditingController();
  TextEditingController _dateToController = TextEditingController();

  DateTime dateFrom = DateTime.now().subtract(Duration(days: 1));
  DateTime dateTo = DateTime.now();
  String? _partyId;

  getPartyData() async {
    await context.read<PartyMasterProvider>().setPartyData(isFroDropdown: true);
  }

  @override
  void initState() {
    _dateFromController.text =
        DateTime.now().subtract(Duration(days: 1)).dateWithYear;
    _dateToController.text = DateTime.now().dateWithYear;

    getPartyData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: '$kLoading $kFilter', isShowBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppSpaces.v16,
              _partyDropdown,
              AppSpaces.v16,
              _dateFrom,
              AppSpaces.v16,
              _dateTo,
              AppSpaces.v16,
              _buttons,
            ],
          ),
        ),
      ),
    );
  }

  get _partyDropdown {
    return Consumer<PartyMasterProvider>(
      builder: (context, provider, child) {
        bool isLoading = provider.isLoading;

        if (isLoading) return AppLoader();

        final data = provider.partyList;
        return AppDropDown<String>(
          // fieldTitle: 'City/Village',
          // isRequired: true,
          hintText: kPlaceHolder,
          labelText: kParty,
          selectedItem: _partyId,

          items: data.map((e) => e.accVou ?? '').toList(),
          string: (item) =>
              data
                  .where((company) => company.accVou == item)
                  .firstOrNull
                  ?.accNm ??
              '',
          onChanged: (value) {
            _partyId = value;
            setState(() {});
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select Party';
            }

            return null;
          },
        );
        ;
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
                screen: LoadingScreen(
                  dateFrom: dateFrom,
                  dateTo: dateTo,
                  partyId: _partyId,
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
            onPressed: () {},
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
