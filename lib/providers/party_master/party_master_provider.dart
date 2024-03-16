import 'package:broker_app/models/party_master/party_master_data.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/party_master/party_master_repo.dart';

class PartyMasterProvider extends AppProvider{
  /// states data list
  List<PartyMasterData> _partyList = [];
  List<PartyMasterData> get partyList => _partyList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> setPartyData({bool notify = false,String searchText =''}) async {
    _isLoading = true;
    if (notify) notifyListeners();

    _partyList = await PartyMasterRepo.fetchPartyData(searchText: searchText);

    _isLoading = false;
    notifyListeners();
  }

  @override
  void clean() {
    // TODO: implement clean
  }
}
