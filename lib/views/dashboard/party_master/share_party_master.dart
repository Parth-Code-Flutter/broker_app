import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_check_box.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/app_text_field.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:broker_app/views/dashboard/party_master/party_master_screen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SharePartyMaster extends StatefulWidget {
  final List<TempClass> list;
  final Function(int) callBack;

  const SharePartyMaster({
    super.key,
    required this.callBack,
    required this.list,
  });

  @override
  State<SharePartyMaster> createState() => _SharePartyMasterState();
}

class _SharePartyMasterState extends State<SharePartyMaster> {
  TextEditingController textController = TextEditingController();
  List<TempClass> list = [];

  double firstTextWidth = 0.26;
  double secondTextWidth = 0.5;

  @override
  void initState() {
    list = widget.list;
    list.forEach((element) {
      if (element.name.isEmpty) {
        element.isSelected = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(
          title: '$kView/$kShare'
              '',
          isShowBackButton: true),
      body: ListView.builder(
        itemCount: list.length,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        itemBuilder: (context, index) {
          var data = list[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.containerBG,
              borderRadius: AppUIUtils.containerBorderRadius,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// name and date
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppCheckBox(
                      size: 14,
                      value: data.isSelected,
                      onChanged: (value) {
                        data.isSelected = !data.isSelected;
                        setState(() {});
                      },
                    ),
                    AppSpaces.h8,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: firstTextWidth.screenWidth,
                          child: AppText(
                            text: data.fieldName,
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
                            text: '${data.name ?? ''}',
                            style: AppTextStyles.tinyListTextStyle
                                .copyWith(fontWeight: FontWeight.w700),
                            maxLines: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryBg,
        onPressed: () {
          Map<String, String> map = {};
          list.forEach((element) {
            if (element.isSelected == true) {
              map.addAll({'\n${element.fieldName}': '${element.name}'});
            }
          });
          print(
              'map:: ${map.toString().replaceAll('{', '\n').replaceAll('}', '\n')}');
          textController.text =
              map.toString().replaceAll('{', '').replaceAll('}', '').replaceAll(',', '');
          setState(() {});
          _shareForm(map);
        },
        label: AppText(
          text: 'OK',
          style: AppTextStyles.appBarTitle.copyWith(
            fontSize: 20,
            color: AppColors.whiteText,
            fontWeight: FontWeight.w500,
          ),
        ),
        // icon: Icon(
        //   Icons.share,
        //   color: AppColors.whiteText,
        // ),
      ),
    );
  }

  _shareForm(map) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 18),
          shape: RoundedRectangleBorder(
              borderRadius: AppUIUtils.primaryBorderRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: AppTextField(
                  controller: textController,
                  labelText: 'Share Text',
                  maxLines: 15,
                  textInputAction: TextInputAction.newline,
                ),
              ),
              AppSpaces.v10,
              AppButton(
                  onPressed: () {
                    Share.share(
                      textController.text
                          .toString()
                          .replaceAll('{', '\n')
                          .replaceAll('}', '\n')
                          .replaceAll(',', ''),
                    );
                  },
                  text: 'SHARE'),
              AppSpaces.v10,
            ],
          ),
        );
      },
    );
    // Share.share(
    //   map
    //       .toString()
    //       .replaceAll('{', '\n')
    //       .replaceAll('}', '\n')
    //       .replaceAll(',', ''),
    // );
  }
}
