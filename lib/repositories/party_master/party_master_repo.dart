import 'package:broker_app/helpers/cloud_functions/cloud_functions_helper.dart';
import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/party_master/party_master_data.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';

class PartyMasterRepo {
  /// fetch states data from api
  static Future<List<PartyMasterData>> fetchPartyData(
      {String searchText = ''}) async {
    try {
      final data = {
        "searchText": searchText,
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
}
