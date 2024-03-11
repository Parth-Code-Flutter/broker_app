import 'package:broker_app/helpers/auth/auth_helper.dart';
import 'package:broker_app/helpers/nav/nav_helper.dart';
import 'package:broker_app/models/ui/drawer_item_model.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/dialogs/app_dialogs.dart';
import 'package:broker_app/utils/keys/app_ui_keys.dart';
import 'package:broker_app/utils/lists/app_lists.dart';
import 'package:broker_app/utils/strings/app_strings.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        bottom: false,
        right: false,
        left: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpaces.v16,
            _title,
            AppSpaces.v32,
            Expanded(child: _items),
            _logoutButton,
            AppSpaces.v16,
          ],
        ),
      ),
    );
  }

  Widget get _title {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: AppText(
        text: AppStrings.menu,
        style: AppTextStyles.drawerTitle,
      ),
    );
  }

  Widget get _items {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = AppLists.drawerItems[index];

        return _item(item);
      },
      separatorBuilder: (context, index) {
        return AppSpaces.v8;
      },
      itemCount: AppLists.drawerItems.length,
    );
  }

  Widget _item(DrawerItem item) {
    final isSelected = AppUIKeys.navKey.currentWidget == item.page;

    return InkWell(
      onTap: () {
        final page = item.page;

        if (page == null) return;

        NavHelper.navigate(
          context: context,
          screen: page,
        );
      },
      borderRadius: AppUIUtils.primaryBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppUIUtils.primaryBorderRadius,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: AppText(
          text: item.name,
          style: AppTextStyles.drawerItem(isSelected),
        ),
      ),
    );
  }

  Widget get _logoutButton {
    return InkWell(
      onTap: () {
        AppDialogs.alertSheet(
          context: context,
          title: AppStrings.logoutAlert,
          alertText: AppStrings.logoutAlertText,
          actionButtonText: AppStrings.logout,
          onOverride: () async {
            await AuthHelper.logout(context);

            // ignore: use_build_context_synchronously
            // NavHelper.navigate(
            //   context: context,
            //   screen: const SignInScreen(),
            //   removeAll: true,
            // );
          },
        );
      },
      borderRadius: AppUIUtils.primaryBorderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppUIUtils.primaryBorderRadius,
          color: AppColors.error.withOpacity(0.2),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            // const AppSvg(
            //   path: AppAssets.logout,
            //   height: 16,
            //   width: 16,
            // ),
            AppSpaces.h16,
            AppText(
              text: AppStrings.logout,
              style: AppTextStyles.drawerItem(false).copyWith(
                color: AppColors.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
