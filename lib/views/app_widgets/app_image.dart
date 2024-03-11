import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppImage {
  /// Network Image
  // static Widget network({
  //   required String? url,
  //   BorderRadius? radius,
  //   BoxFit? fit,
  //   double? height,
  //   double? width,
  // }) {
  //   if (url == '' || url == null) {
  //     return Container();
  //   }
  //   return shapeImage(
  //     radius: radius,
  //     // image: Image.network(
  //     //   url,
  //     //   fit: fit,
  //     //   height: height,
  //     //   width: width,
  //     // ),
  //     image: CachedNetworkImage(
  //       imageUrl: url,
  //       height: height,
  //       width: width,
  //       fit: fit,
  //     ),
  //   );
  // }

  /// File Image
  static Widget file({
    required String path,
    BorderRadius? radius,
    BoxFit? fit,
    double? height,
    double? width,
  }) {
    return shapeImage(
      radius: radius,
      image: Image.file(
        File(path),
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }

  static Widget asset({
    required String path,
    BorderRadius? radius,
    BoxFit? fit,
    double? height,
    double? width,
  }) {
    return shapeImage(
      radius: radius,
      image: Image.asset(
        path,
        fit: fit,
        height: height,
        width: width,
      ),
    );
  }

  static Widget shapeImage({
    required BorderRadius? radius,
    required Widget image,
  }) {
    if (radius == null) return image;

    return ClipRRect(
      borderRadius: radius,
      child: image,
    );
  }
}
