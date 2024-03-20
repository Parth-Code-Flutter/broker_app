import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/providers/sign_in/sign_in_provider.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/dialogs/app_dialogs.dart';
import 'package:broker_app/utils/extensions/app_size_extension.dart';
import 'package:broker_app/utils/globals/app_globals.dart';
import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_button.dart';
import 'package:broker_app/views/app_widgets/app_image.dart';
import 'package:broker_app/views/app_widgets/app_loader.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:broker_app/views/auth/change_pin/change_pin_screen.dart';
import 'package:broker_app/views/auth/verify_pin/verify_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    setUserData();
    super.initState();
  }

  setUserData() {
    context.read<SignInProvider>().setUserData();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar:
          appBar(title: kProfile, isShowBackButton: true, isShowActions: false),
      body: Consumer<SignInProvider>(
        builder: (context, provider, child) {
          bool isLoading = provider.isLoading;
          if (isLoading) return AppLoader();
          return Column(
            children: [
              // _header,
              // AppSpaces.v56,
              // _personName,
              AppSpaces.v16,
              _personDetails,
              _buttons,
            ],
          );
        },
      ),
    );
  }

  Widget get _header {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: AppColors.primaryBg),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            // height: 0.15.screenHeight,
            height: 0.08.screenHeight,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => NavHelper.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SvgPicture.asset(AppAssets.backArrowIcon),
                          ),
                        ),
                        AppText(
                          text: kProfile,
                          style: AppTextStyles.appBarTitle,
                        ),
                      ],
                    ),
                    // Image.asset(
                    //   AppAssets.notificationIcon,
                    //   height: 25,
                    //   width: 20,
                    // ),
                  ],
                )
              ],
            ),
          ),
          // Positioned.fill(
          //   bottom: -50,
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: CircleAvatar(
          //       radius: 50,
          //       child: AppImage.asset(path: AppAssets.dummyProfile),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget get _personName {
    return Column(
      children: [
        AppText(
          text: 'Mr. Rakshit Mehta',
          style: AppTextStyles.textFieldTitle.copyWith(
              fontWeight: FontWeight.w600, color: AppColors.blackShade),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.locationIcon),
            AppSpaces.h4,
            AppText(
              text: 'Mumbai',
              style: AppTextStyles.supportSubTitle.copyWith(
                color: AppColors.locationText,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get _personDetails {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          /// phone no.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: kName,
                style: AppTextStyles.textFieldBlackShade.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightGrey,
                ),
              ),
              AppText(
                text: context.read<SignInProvider>().userData.name ?? '',
                style: AppTextStyles.textFieldBlackShade.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          AppSpaces.v6,

          /// email
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: kEmail,
                style: AppTextStyles.textFieldBlackShade.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightGrey,
                ),
              ),
              AppText(
                text: context.read<SignInProvider>().userData.email ?? '',
                style: AppTextStyles.textFieldBlackShade.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          AppSpaces.v6,

          /// phone no.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                text: kPhoneNo,
                style: AppTextStyles.textFieldBlackShade.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.lightGrey,
                ),
              ),
              AppText(
                text: context.read<SignInProvider>().userData.mobile ?? '',
                style: AppTextStyles.textFieldBlackShade.copyWith(
                    color: AppColors.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          AppSpaces.v6,

          // /// birthdate
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     AppText(
          //       text: kBirthDate,
          //       style: AppTextStyles.textFieldBlackShade.copyWith(
          //         fontWeight: FontWeight.w600,
          //         color: AppColors.lightGrey,
          //       ),
          //     ),
          //     AppText(
          //       text: '23-12-2002',
          //       style: AppTextStyles.textFieldBlackShade.copyWith(
          //           color: AppColors.primary, fontWeight: FontWeight.w600),
          //     ),
          //   ],
          // ),
          // AppSpaces.v6,

          // /// address
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     AppText(
          //       text: kAddress,
          //       style: AppTextStyles.textFieldBlackShade.copyWith(
          //         fontWeight: FontWeight.w600,
          //         color: AppColors.lightGrey,
          //       ),
          //     ),
          //     AppText(
          //       text: 'Mumbai,India',
          //       style: AppTextStyles.textFieldBlackShade.copyWith(
          //           color: AppColors.primary, fontWeight: FontWeight.w600),
          //     ),
          //   ],
          // ),
          // AppSpaces.v6,

          // /// gender
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     AppText(
          //       text: kGender,
          //       style: AppTextStyles.textFieldBlackShade.copyWith(
          //         fontWeight: FontWeight.w600,
          //         color: AppColors.lightGrey,
          //       ),
          //     ),
          //     AppText(
          //       text: 'Male',
          //       style: AppTextStyles.textFieldBlackShade.copyWith(
          //           color: AppColors.primary, fontWeight: FontWeight.w600),
          //     ),
          //   ],
          // ),
          // AppSpaces.v6,
        ],
      ),
    );
  }

  Widget get _buttons {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: AppButton(
              onPressed: () {
                NavHelper.navigate(
                  context: context,
                  screen: ChangePinScreen(
                    hasPin: AppGlobals.instance.hasPin ?? false,
                    pin: null,
                  ),
                );
              },
              text: kChangeMPin,
              borderRadius: AppUIUtils.buttonBorderRadius5,
              borderColor: AppColors.containerBG,
              color: AppColors.containerBG,
              textStyle: AppTextStyles.dashboardText.copyWith(),
            ),
          ),
          AppSpaces.h16,
          Flexible(
            flex: 1,
            child: AppButton(
              onPressed: () {
                AppDialogs.alertSheet(
                  context: context,
                  title: AppStrings.logoutAlert,
                  alertText: AppStrings.logoutAlertText,
                  actionButtonText: AppStrings.logout,
                  onOverride: () async {
                    await AuthHelper.logout(context);

                    // ignore: use_build_context_synchronously
                    NavHelper.navigate(
                      context: context,
                      screen: const VerifyPinScreen(),
                      removeAll: true,
                    );
                  },
                );
              },
              text: kLogout,
              borderRadius: AppUIUtils.buttonBorderRadius5,
              color: AppColors.containerBG,
              borderColor: AppColors.containerBG,
              textStyle: AppTextStyles.dashboardText.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
