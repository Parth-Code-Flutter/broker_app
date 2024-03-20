import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/utils/ui/app_ui_utils.dart';
import 'package:broker_app/views/app_widgets/app_spaces.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    required this.items,
    required this.string,
    required this.onChanged,
    super.key,
    this.selectedItem,
    this.prefix,
    this.labelText,
    this.labelStyle,
    this.floatingLabelStyle,
    this.hintText,
    this.error = false,
    this.fieldTitle,
    this.isRequired = false,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.validator,
  });

  final List<T> items;
  final T? selectedItem;
  final String Function(T item) string;
  final void Function(T? value)? onChanged;
  final Widget? prefix;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? floatingLabelStyle;
  final String? hintText;
  final bool error;
  final String? fieldTitle;
  final bool isRequired;
  final EdgeInsetsGeometry padding;
  final String? Function(T? value)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (fieldTitle != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: fieldTitle!,
                style: AppTextStyles.homeDocName,
              ),
              if (isRequired)
                AppText(
                  text: ' *',
                  style: AppTextStyles.requiredSign,
                ),
            ],
          ),
          AppSpaces.v8,
        ],
        DropdownSearch<T>(
          enabled: onChanged != null,
          onChanged: onChanged,
          selectedItem: selectedItem,
          items: items,
          itemAsString: string,
          popupProps: PopupProps.menu(
            fit: FlexFit.loose,
            showSearchBox: true,
            searchDelay: Duration.zero,
            itemBuilder: (context, item, isSelected) {
              return Container(
                color: AppColors.whiteBg,
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: string(item),
                      style: AppTextStyles.textFieldText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Divider(color: AppColors.primary, height: 1),
                  ],
                ),
              );
            },
            searchFieldProps: TextFieldProps(
              style: AppTextStyles.textFieldText,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: AppTextStyles.textFieldHint(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                fillColor: AppColors.whiteBg,
                filled: true,
                border: _enabledBorder,
                enabledBorder: _enabledBorder,
                focusedBorder: _focusedBorder,
              ),
            ),
          ),
          clearButtonProps: const ClearButtonProps(
            icon: Icon(
              Icons.clear,
              size: 16,
            ),
            isVisible: false,
            constraints: BoxConstraints(),
            padding: EdgeInsets.zero,
            iconSize: 16,
            alignment: Alignment.centerRight,
          ),
          dropdownButtonProps: DropdownButtonProps(
            // iconSize: 16,
            iconSize: 24,
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity(horizontal: -4),
            icon: const Icon(
              // Icons.keyboard_arrow_down_rounded,
              Icons.arrow_drop_down_sharp,
            ),
            color: AppColors.buttonBg,
            disabledColor: AppColors.darkGreyText,
          ),
          validator: validator,
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              fillColor: AppColors.whiteBg,
              filled: true,
              isDense: true,
              contentPadding: padding,
              hintText: hintText,
              hintStyle: AppTextStyles.textFieldHint(),
              labelText: labelText,
              floatingLabelStyle:
                  AppTextStyles.textFieldLabel(isFloating: true),
              labelStyle: AppTextStyles.textFieldLabel(isFloating: false),
              enabledBorder: _enabledBorder,
              focusedBorder: _focusedBorder,
              errorBorder: _enabledErrorBorder,
              focusedErrorBorder: _focusedErrorBorder,
              prefixIcon: prefix,
              prefixIconConstraints: const BoxConstraints(),
              disabledBorder: _enabledBorder,
              // constraints: BoxConstraints(
              //   maxHeight: 30,
              //   minHeight: 30,
              //   maxWidth: 0.50.screenWidth,
              //   minWidth: 0.50.screenWidth,
              // ),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder get _enabledBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: error ? Colors.red : AppColors.textFieldBorder,
        width: error ? 0.7 : 0.8,
      ),
    );
  }

  InputBorder get _focusedBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: error ? Colors.red : AppColors.primary,
        width: error ? 0.7 : 0.8,
      ),
    );
  }

  InputBorder get _enabledErrorBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: AppColors.error,
        width: error ? 0.7 : 1,
      ),
    );
  }

  InputBorder get _focusedErrorBorder {
    return OutlineInputBorder(
      borderRadius: AppUIUtils.primaryBorderRadius,
      borderSide: BorderSide(
        color: AppColors.primary,
        width: error ? 0.7 : 1,
      ),
    );
  }
}
