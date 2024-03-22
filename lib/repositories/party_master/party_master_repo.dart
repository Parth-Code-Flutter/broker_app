import 'package:broker_app/helpers/cloud_functions/cloud_functions_helper.dart';
import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/party_master/party_master_data.dart';
import 'package:broker_app/models/voucher_data/voucher_data.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';
import 'package:broker_app/utils/globals/app_globals.dart';

class PartyMasterRepo {
  static Future<List<PartyMasterData>> fetchPartyData(
      {String searchText = '',
      required int limit,
      required int offset,
      bool isFroDropdown = false}) async {
    try {
      String companyId = AppGlobals.instance.companyId ?? '0';
      final data = {
        "searchText": searchText,
        "companyId": companyId,
        if (searchText.isEmpty && isFroDropdown == false) "limit": limit,
        if (searchText.isEmpty && isFroDropdown == false) "offset": offset,
      };

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.getParties,
        data: data,
      );
      if (!result.success || result.data == null) return [];

      final partyData = <PartyMasterData>[];

      for (final json in result.data as List) {
        try {
          final state = PartyMasterData.fromJson(json as Map<String, dynamic>);
          partyData.add(state);
        } catch (e) {
          DevHelper.log(e);
        }
      }

      return partyData;
    } catch (e) {
      DevHelper.log(e);
      return [];
    }
  }

  static Future<List<VoucherData>> fetchVoucherData() async {
    try {
      String companyId = AppGlobals.instance.companyId ?? '0';
      String yearId = AppGlobals.instance.yearId ?? '0';
      final data = {
        "yearId": yearId,
        "companyId": companyId,
      };

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.getVoucherTypes,
        data: data,
      );
      if (!result.success || result.data == null) return [];

      final voucherData = <VoucherData>[];

      for (final json in result.data as List) {
        try {
          final state = VoucherData.fromJson(json as Map<String, dynamic>);
          voucherData.add(state);
        } catch (e) {
          DevHelper.log(e);
        }
      }

      return voucherData;
    } catch (e) {
      DevHelper.log(e);
      return [];
    }
  }
}
