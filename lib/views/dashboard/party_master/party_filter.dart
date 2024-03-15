import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';

class PartyFilter extends StatefulWidget {
  const PartyFilter({super.key});

  @override
  State<PartyFilter> createState() => _PartyFilterState();
}

class _PartyFilterState extends State<PartyFilter> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: '$kPartyMaster $kFilter', isShowBackButton: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            AppTextField(
              controller: _nameController,
              hintText: kPlaceHolder,
              labelText: kName,
            ),
            AppSpaces.v16,
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: AppButton(
                    onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
