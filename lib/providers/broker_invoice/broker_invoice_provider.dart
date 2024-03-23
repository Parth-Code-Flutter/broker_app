import 'package:broker_app/models/broker_invoice/broker_invoice_data.dart';
import 'package:broker_app/providers/app_provider.dart';
import 'package:broker_app/repositories/broker_invoice_repo/broker_invoice_repo.dart';

class BrokerInvoiceProvider extends AppProvider {

  List<BrokerInvoiceData> _brokerInvoices = [];
  List<BrokerInvoiceData> get brokerInvoices => _brokerInvoices;

  int offset = 0;
  int limit = 10;
  bool isListEmpty = false;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> setBrokerInvoiceData({
    bool notify = false,
    String partyId = '',
    String buyerId = '',
    String sellerId = '',
    String voucherTypeId = '',
    String dateFrom = '',
    String dateTo = '',
    String searchText = '',
  }) async {
    _isLoading = true;
    if (notify) notifyListeners();

    var data = await BrokerInvoiceRepo.fetchBrokerInvoice(
      searchText: searchText,
      partyId: partyId,
      buyerId: buyerId,
      sellerId: sellerId,
      voucherTypeId: voucherTypeId,
      dateFrom: dateFrom,
      dateTo: dateTo,
      limit: limit,
      offset: offset,
    );
    _brokerInvoices.addAll(data);
    if (_brokerInvoices.isEmpty) {
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
    _brokerInvoices = [];
    offset = 0;
    limit = 10;
    isListEmpty = false;
    // TODO: implement clean
  }
}
