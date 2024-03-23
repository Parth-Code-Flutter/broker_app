import 'package:broker_app/providers/broker_invoice/broker_invoice_provider.dart';
import 'package:broker_app/providers/contracts/contracts_provider.dart';
import 'package:broker_app/providers/loading/loading_provider.dart';
import 'package:broker_app/providers/loading_payment_provider/loading_payment_provider.dart';
import 'package:broker_app/providers/location/app_location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'party_master/party_master_provider.dart';
import 'sign_in/sign_in_provider.dart';

abstract class AppProvider extends ChangeNotifier {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => SignInProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AppLocationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PartyMasterProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ContractsProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoadingProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoadingPaymentProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => BrokerInvoiceProvider(),
    ),
  ];

  static void cleanAllData(BuildContext context) {
    context.read<SignInProvider>().clean();
    context.read<AppLocationProvider>().clean();
    context.read<PartyMasterProvider>().clean();
    context.read<ContractsProvider>().clean();
    context.read<LoadingProvider>().clean();
    context.read<LoadingPaymentProvider>().clean();
    context.read<BrokerInvoiceProvider>().clean();
  }

  void clean();
}
