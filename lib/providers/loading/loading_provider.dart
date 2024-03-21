import 'package:broker_app/models/contracts/contracts_data.dart';
import 'package:broker_app/models/loading/loading_data.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/contracts_repo/contracts_repo.dart';
import 'package:broker_app/repositories/loading_repo/loading_repo.dart';

class LoadingProvider extends AppProvider {

  List<LoadingData> _loadings = [];
  List<LoadingData> get loadings => _loadings;

  int offset = 0;
  int limit = 10;
  bool isListEmpty = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> setLoadingsData({
    bool notify = false,
    String partyId = '',
    String buyerId = '',
    String sellerId = '',
    String dateFrom = '',
    String dateTo = '',
    String searchText = '',
  }) async {
    _isLoading = true;
    if (notify) notifyListeners();

    var data = await LoadingRepo.fetchLoadings(
      searchText: searchText,
      partyId: partyId,
      buyerId: buyerId,
      sellerId: sellerId,
      dateFrom: dateFrom,
      dateTo: dateTo,
      limit: limit,
      offset: offset,
    );
    _loadings.addAll(data);
    if (_loadings.isEmpty) {
      isListEmpty = true;
    } else {
      offset = offset + 10;
    }

    // _contracts.sort((a, b) => (a.productName ?? '').compareTo((b.productName ?? '')));
    _isLoading = false;
    notifyListeners();
  }

  @override
  void clean() {
    _loadings = [];
    offset = 0;
    limit = 10;
    // TODO: implement clean
  }
}
