enum PaymentMode {
  online,
  cheque,
  cash,
  drNote;

  factory PaymentMode.fromInt(int value) {
    switch (value) {
      case 1:
        return PaymentMode.online;
      case 2:
        return PaymentMode.cheque;
      case 3:
        return PaymentMode.cash;
      case 4:
        return PaymentMode.drNote;
      default:
        throw Error();
    }
  }

  int get intDB {
    switch (this) {
      case online:
        return 1;
      case cheque:
        return 2;
      case cash:
        return 3;
      case drNote:
        return 4;
    }
  }

  String get string {
    switch (this) {
      case online:
        return 'NEFT/RTGS';
      case cheque:
        return 'Cheque';
      case cash:
        return 'Cash';
      case drNote:
        return 'D.R. Note';
    }
  }
}
