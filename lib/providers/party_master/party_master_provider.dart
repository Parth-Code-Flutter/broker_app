import 'package:broker_app/models/party_master/party_master_data.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/party_master/party_master_repo.dart';

class PartyMasterProvider extends AppProvider {

  List<PartyMasterData> _partyList = [];
  List<PartyMasterData> get partyList => _partyList;

  int offset = 10;
  int limit = 10;
  bool isListEmpty = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> setPartyData(
      {bool notify = false, String searchText = ''}) async {
    _isLoading = true;
    if (notify) notifyListeners();

    _partyList = await PartyMasterRepo.fetchPartyData(
        searchText: searchText, offset: offset, limit: limit);

    if (_partyList.isEmpty) {
      isListEmpty = true;
    } else {
      offset = offset + 10;
    }
    _partyList.sort((a, b) => (a.accNm ?? '').compareTo((b.accNm ?? '')));

    _isLoading = false;
    notifyListeners();
  }

  @override
  void clean() {
    // TODO: implement clean
  }
}
