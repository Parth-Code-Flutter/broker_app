import 'package:broker_app/helpers/cloud_functions/cloud_functions_helper.dart';
import 'package:broker_app/helpers/dev/dev_helper.dart';
import 'package:broker_app/models/user/user_data.dart';
import 'package:broker_app/models/year_selection/year_selection.dart';
import 'package:broker_app/utils/firebase/cloud_functions_names.dart';

class AuthRepo {
  /// fetch states data from api
  static Future<List<YearData>> fetchYearsData(
      {required String companyId}) async {
    try {
      final data = {
        "companyId": companyId,
      };

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.getYears,
        data: data,
      );
      if (!result.success || result.data == null) return [];

      final years = <YearData>[];

      for (final json in result.data as List) {
        try {
          final state = YearData.fromJson(json as Map<String, dynamic>);
          years.add(state);
        } catch (e) {
          DevHelper.log(e);
        }
      }

      return years;
    } catch (e) {
      DevHelper.log(e);
      return [];
    }
  }

  /// fetch states data from api
  static Future<UserData?> fetchUserData() async {
    try {
      final data = {};

      final result = await CloudFunctionsHelper.call(
        name: CloudFunctionsNames.getProfile,
        data: data,
      );
      if (!result.success || result.data == null) return null;

      var userData = UserData();
      userData = UserData.fromJson(result.data);
      // for (final json in result.data as List) {
      //   try {
      //     final state = YearData.fromJson(json as Map<String, dynamic>);
      //     years.add(state);
      //   } catch (e) {
      //     DevHelper.log(e);
      //   }
      // }

      return userData;
    } catch (e) {
      DevHelper.log(e);
      return null;
    }
  }
}
