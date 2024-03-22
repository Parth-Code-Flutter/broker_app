import 'dart:async';

import 'package:broker_app/models/user/splash_data.dart';
import 'package:broker_app/models/user/user_data.dart';
import 'package:broker_app/models/year_selection/year_selection.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/auth/auth_repo.dart';
import 'package:broker_app/utils/globals/app_globals.dart';

class SignInProvider extends AppProvider {
  String? _phone;

  String? get phone => _phone;

  Timer? _timer;

  int _secondsLeft = 60;

  int get secondsLeft => _secondsLeft;

  /// states data list
  List<YearData> _years = [];
  List<YearData> get years => _years;

  UserData _userData = UserData();
  UserData get userData => _userData;

  SplashData _splashData = SplashData();
  SplashData get splashData => _splashData;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> setYearsData({bool notify = false}) async {
    _isLoading = true;
    if (notify) notifyListeners();
    String companyId = AppGlobals.instance.companyId ?? '';

    _years = await AuthRepo.fetchYearsData(companyId: companyId);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setUserData({bool notify = false}) async {
    _isLoading = true;
    if (notify) notifyListeners();

    _userData = await AuthRepo.fetchUserData()??UserData();

    _isLoading = false;
    notifyListeners();
  }


  Future<void> setSplashImgData(
      {bool notify = false}) async {
    _isLoading = true;
    if (notify) notifyListeners();

    _splashData = await AuthRepo.fetchSplashImg()??SplashData();

    // _voucherList.sort((a, b) => (a.accNm ?? '').compareTo((b.accNm ?? '')));

    _isLoading = false;
    notifyListeners();
  }


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
