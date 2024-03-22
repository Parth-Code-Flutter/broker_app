import 'package:broker_app/models/party_master/party_master_data.dart';
import 'package:broker_app/models/voucher_data/voucher_data.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/party_master/party_master_repo.dart';

class PartyMasterProvider extends AppProvider {
  List<PartyMasterData> _partyList = [];
  List<PartyMasterData> get partyList => _partyList;

  List<VoucherData> _voucherList = [];
  List<VoucherData> get voucherList => _voucherList;

  int offset = 0;
  int limit = 10;
  bool isListEmpty = false;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void clearList() {
    _partyList = [];
  }

  Future<void> setPartyData(
      {bool notify = false,
      String searchText = '',
      bool isFroDropdown = false}) async {
    _isLoading = true;
    if (notify) notifyListeners();

    var list = await PartyMasterRepo.fetchPartyData(
        searchText: searchText,
        offset: offset,
        limit: limit,
        isFroDropdown: isFroDropdown);

    _partyList.addAll(list);
    print('_partyList length :: ${_partyList.length}');
    if (_partyList.isEmpty) {
      isListEmpty = true;
    } else {
      offset = offset + 10;
    }
    // _partyList.sort((a, b) => (a.accNm ?? '').compareTo((b.accNm ?? '')));

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setVoucherData(
      {bool notify = false}) async {
    _isLoading = true;
    if (notify) notifyListeners();

    _voucherList = await PartyMasterRepo.fetchVoucherData();

    // _voucherList.sort((a, b) => (a.accNm ?? '').compareTo((b.accNm ?? '')));

    _isLoading = false;
    notifyListeners();
  }

  @override
  void clean() {
    _partyList = [];
    offset = 0;
    limit = 10;
    isListEmpty =false;
    // TODO: implement clean
  }
}
