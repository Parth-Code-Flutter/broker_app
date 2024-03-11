import 'package:broker_app/providers/location/app_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'sign_in/sign_in_provider.dart';

abstract class AppProvider extends ChangeNotifier {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => SignInProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppLocationProvider(),
    ),
  ];

  static void cleanAllData(BuildContext context) {
    context.read<SignInProvider>().clean();
    context.read<AppLocationProvider>().clean();
  }

  void clean();
}
