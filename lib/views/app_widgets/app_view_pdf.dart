import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class AppViewPdf extends StatelessWidget {
  const AppViewPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: PDFView(),
    );
  }
}
