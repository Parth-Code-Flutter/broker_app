import 'dart:io';

import 'package:broker_app/utils/enums/svg_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  const AppSvg({
    required this.path,
    super.key,
    this.height,
    this.width,
    this.fit,
    this.type = SvgType.asset,
    this.color,
  });

  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final SvgType type;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: _svg,
    );
  }

  Widget get _svg {
    switch (type) {
      case SvgType.asset:
        return SvgPicture.asset(
          path,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                )
              : null,
        );
      case SvgType.file:
        return SvgPicture.file(
          File(path),
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                )
              : null,
        );
      case SvgType.network:
        return SvgPicture.network(
          path,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                )
              : null,
        );
    }
  }
}
