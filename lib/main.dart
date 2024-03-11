import 'package:broker_app/app.dart';
import 'package:broker_app/firebase_options.dart';
import 'package:broker_app/helpers/init/init_helper.dart';
import 'package:broker_app/helpers/local_storage/shared_prefs_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await InitHelper.initApp();

  final isAuthenticated = await SharedPrefsHelper.isAuthenticated;
  final hasPin = await SharedPrefsHelper.hasPin;

  runApp(
    AppMain(
      isAuthenticated: isAuthenticated,
      hasPin: hasPin,
    ),
  );
}
