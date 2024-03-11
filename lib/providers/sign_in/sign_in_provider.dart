import 'dart:async';

import 'package:broker_app/providers/app_provider.dart';

class SignInProvider extends AppProvider {
  String? _phone;

  String? get phone => _phone;

  Timer? _timer;

  int _secondsLeft = 60;

  int get secondsLeft => _secondsLeft;

  void setPhone(String number) {
    _phone = number;
    notifyListeners();
  }

  void reset() {
    _secondsLeft = 60;
    notifyListeners();
  }

  Future<void> startTimer() async {
    await Future<void>.delayed(Duration.zero);
    const oneSec = Duration(seconds: 1);
    _secondsLeft = 60;

    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsLeft == 0) {
          timer.cancel();
          notifyListeners();
        } else {
          _secondsLeft--;
          notifyListeners();
        }
      },
    );
  }

  void stop() {
    _timer?.cancel();
    notifyListeners();
  }

  @override
  void clean() {
    _timer?.cancel();
    _timer = null;
    _secondsLeft = 60;
    _phone = null;
    notifyListeners();
  }
}
