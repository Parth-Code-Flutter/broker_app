import 'package:broker_app/helpers/cloud_functions/cloud_functions_helper.dart';
import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/broker_invoice/broker_invoice_data.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';
import 'package:broker_app/utils/globals/app_globals.dart';

class BrokerInvoiceRepo {
  static Future<List<BrokerInvoiceData>> fetchBrokerInvoice({
    String partyId = '',
    String buyerId = '',
    String sellerId = '',
    String voucherTypeId = '',
    String dateFrom = '',
    String dateTo = '',
    String searchText = '',
    required int limit,
    required int offset,
  }) async {
    try {
      String companyId = AppGlobals.instance.companyId ?? '0';
      String yearId = AppGlobals.instance.yearId ?? '0';
      final data = {
        "yearId": yearId,
        "companyId": companyId,
        "searchText": searchText,
        if (partyId.isNotEmpty) "partyId": partyId,
        if (buyerId.isNotEmpty) "buyerId": buyerId,
        if (sellerId.isNotEmpty) "sellerId": sellerId,
        if (dateFrom.isNotEmpty) "dateFrom": dateFrom,
        if (dateTo.isNotEmpty) "dateTo": dateTo,
        "limit": limit,
        "offset": offset,
      };

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.getInvoices,
        data: data,
      );
      if (!result.success || result.data == null) return [];

      final brokerInvoiceList = <BrokerInvoiceData>[];

      for (final json in result.data as List) {
        try {
          final loadings =
              BrokerInvoiceData.fromJson(json as Map<String, dynamic>);
          brokerInvoiceList.add(loadings);
        } catch (e) {
          DevHelper.log(e);
        }
      }

      return brokerInvoiceList;
    } catch (e) {
      DevHelper.log(e);
      return [];
    }
  }
}
