class AppRegex {
  static RegExp get phone => RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  static RegExp get emailNumberRegex =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  static RegExp get panNumber =>
      RegExp(r'^"[A-Z]{5}[0-9]{4}[A-Z]{1}');
}
