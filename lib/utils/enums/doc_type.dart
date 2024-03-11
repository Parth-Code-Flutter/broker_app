import 'package:broker_app/utils/strings/app_strings.dart';

enum DocType {
  photo,
  oldPolicy,
  aadhaar,
  drivingLic,
  rcBookFront,
  rcBookBack,
  cancelCheque,
  panCard,
  img;

  factory DocType.fromString(String type) {
    switch (type) {
      case 'PHOTO':
        return photo;
      case 'OLD POLICY COPY':
        return oldPolicy;
      case 'AADHAR':
        return aadhaar;
      case 'DRIVING LIC':
        return drivingLic;
      case 'RC BOOK FRONT':
        return rcBookFront;
      case 'RC BOOK BACK':
        return rcBookBack;
      case 'CANCEL CHEQUE':
        return cancelCheque;
      case 'PAN CARD':
        return panCard;
      case 'IMG':
        return img;
      default:
        return photo;
    }
  }

  String get stringDB {
    switch (this) {
      case photo:
        return 'PHOTO';
      case oldPolicy:
        return 'OLD POLICY COPY';
      case aadhaar:
        return 'AADHAR';
      case drivingLic:
        return 'DRIVING LIC';
      case rcBookFront:
        return 'RC BOOK FRONT';
      case rcBookBack:
        return 'RC BOOK BACK';
      case cancelCheque:
        return 'CANCEL CHEQUE';
      case panCard:
        return 'PAN CARD';
      case img:
        return 'IMG';
    }
  }

  String get string {
    switch (this) {
      case photo:
        return AppStrings.photo;
      case oldPolicy:
        return AppStrings.oldPolicy;
      case aadhaar:
        return AppStrings.aadhaar;
      case drivingLic:
        return AppStrings.drivingLic;
      case rcBookFront:
        return AppStrings.rcBookFront;
      case rcBookBack:
        return AppStrings.rcBookBack;
      case cancelCheque:
        return AppStrings.cancelCheque;
      case panCard:
        return AppStrings.panCard;
      case img:
        return AppStrings.img;
    }
  }
}
