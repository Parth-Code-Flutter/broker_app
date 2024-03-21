import 'package:broker_app/helpers/cloud_functions/cloud_functions_helper.dart';
import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/loading/loading_data.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';
import 'package:broker_app/utils/globals/app_globals.dart';

class LoadingRepo{
  static Future<List<LoadingData>> fetchLoadings({
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
        name: CloudFunctionsNames.getLoadings,
        data: data,
      );
      if (!result.success || result.data == null) return [];

      final loadingList = <LoadingData>[];

      for (final json in result.data as List) {
        try {
          final loadings =
          LoadingData.fromJson(json as Map<String, dynamic>);
          loadingList.add(loadings);
        } catch (e) {
          DevHelper.log(e);
        }
      }

      return loadingList;
    } catch (e) {
      DevHelper.log(e);
      return [];
    }
  }
}