import 'package:broker_app/models/contracts/contracts_data.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/contracts_repo/contracts_repo.dart';

class ContractsProvider extends AppProvider {

  List<ContractsData> _contracts = [];
  List<ContractsData> get contracts => _contracts;

  int offset = 10;
  int limit = 10;
  bool isListEmpty = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> setContractsData({
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

    _contracts = await ContractsRepo.fetchContracts(
      partyId: partyId,
      buyerId: buyerId,
      sellerId: sellerId,
      dateFrom: dateFrom,
      dateTo: dateTo,
      limit: limit,
      offset: offset,
    );
    if (_contracts.isEmpty) {
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
    // TODO: implement clean
  }
}
