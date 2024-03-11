// ignore_for_file: avoid_positional_boolean_parameters

import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    required this.value,
    required this.onChanged,
    super.key,
    this.size,
  });

  final bool value;
  final void Function(bool? value) onChanged;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 24,
      width: size ?? 24,
      child: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(width: 0.5),
        fillColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primary;
            }
            return AppColors.whiteBg;
          },
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
