import 'package:broker_app/utils/strings/app_assets.dart';
import 'package:broker_app/views/dashboard/contracts/contracts_screen.dart';
import 'package:broker_app/views/dashboard/loading/loading_screen.dart';
import 'package:broker_app/views/dashboard/party_master/party_master_screen.dart';
import 'package:flutter/material.dart';

class DashboardData {
  String title;
  String imgPath;
  Widget? navigateTo;

  DashboardData({required this.title, required this.imgPath, this.navigateTo});

  static List<DashboardData> dashboardDataList = [
    DashboardData(
      title: 'Contracts',
      imgPath: AppAssets.contracts,
      navigateTo: ContractsScreen(),
    ),
    DashboardData(
      title: 'Loading',
      imgPath: AppAssets.dashboardLoading,
      navigateTo: LoadingScreen(),
    ),
    DashboardData(title: 'Loading Payment', imgPath: AppAssets.loadingPayment),
    DashboardData(title: 'Broker Invoice', imgPath: AppAssets.brokerInvoice),
    DashboardData(
      title: 'Party Master',
      imgPath: AppAssets.partyMaster,
      navigateTo: PartyMasterScreen(),
    ),
  ];
}
