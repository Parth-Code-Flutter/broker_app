import 'package:broker_app/utils/strings/app_strings.dart';

enum Gender {
  male,
  female;

  factory Gender.fromString(String gender) {
    switch (gender) {
      case '1':
        return Gender.male;
      case '2':
        return Gender.female;
      default:
        throw ArgumentError('Unknown gender: $gender');
    }
  }

  String get stringDB {
    switch (this) {
      case male:
        return '1';
      case female:
        return '2';
    }
  }

  String get string {
    switch (this) {
      case male:
        return AppStrings.male;
      case female:
        return AppStrings.female;
    }
  }
}
