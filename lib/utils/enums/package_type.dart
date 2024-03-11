import 'package:broker_app/utils/strings/app_strings.dart';

enum PackageType {
  bag,
  box,
  drum;

  factory PackageType.fromString(String type) {
    switch (type) {
      case 'bag':
        return bag;
      case 'box':
        return box;
      case 'drum':
        return drum;
      default:
        throw Exception('Invalid package type');
    }
  }

  String get string {
    switch (this) {
      case bag:
        return AppStrings.bag;
      case box:
        return AppStrings.box;
      case drum:
        return AppStrings.drum;
    }
  }

  String get stringDB {
    switch (this) {
      case bag:
        return 'bag';
      case box:
        return 'box';
      case drum:
        return 'drum';
    }
  }
}
