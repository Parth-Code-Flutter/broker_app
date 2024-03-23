import 'package:broker_app/models/loading_payment/loading_payment_data.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/loading_payment_repo/loading_payment_repo.dart';

class LoadingPaymentProvider extends AppProvider{

  List<LoadingPaymentData> _loadingPayments = [];
  List<LoadingPaymentData> get loadingPayments => _loadingPayments;

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

    var data = await LoadingPaymentRepo.fetchLoadingPayments(
      searchText: searchText,
      partyId: partyId,
      buyerId: buyerId,
      sellerId: sellerId,
      dateFrom: dateFrom,
      dateTo: dateTo,
      limit: limit,
      offset: offset,
    );
    _loadingPayments.addAll(data);
    if (_loadingPayments.isEmpty) {
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
    _loadingPayments = [];
    offset = 0;
    limit = 10;
    isListEmpty = false;
    // TODO: implement clean
  }
}