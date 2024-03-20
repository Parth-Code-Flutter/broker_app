import 'package:broker_app/helpers/cloud_functions/cloud_functions_helper.dart';
import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/contracts/contracts_data.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';
import 'package:broker_app/utils/globals/app_globals.dart';

class ContractsRepo {
  static Future<List<ContractsData>> fetchContracts({
    String partyId = '',
    String buyerId = '',
    String sellerId = '',
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
        name: CloudFunctionsNames.getContracts,
        data: data,
      );
      if (!result.success || result.data == null) return [];

      final contractList = <ContractsData>[];

      for (final json in result.data as List) {
        try {
          final contracts =
              ContractsData.fromJson(json as Map<String, dynamic>);
          contractList.add(contracts);
        } catch (e) {
          DevHelper.log(e);
        }
      }

      return contractList;
    } catch (e) {
      DevHelper.log(e);
      return [];
    }
  }
}
