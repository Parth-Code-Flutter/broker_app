import 'dart:io';

import 'package:broker_app/constants/app_constants.dart';
import 'package:broker_app/utils/colors/app_colors.dart';
import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class AppViewPdf extends StatelessWidget {
  final String filePath;
  final PdfViewerController _pdfViewerController = PdfViewerController();

  AppViewPdf({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(title: kViewPdf, isShowBackButton: true),
      body: SfPdfViewer.network(
        filePath,
        controller: _pdfViewerController,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primaryBg,
        onPressed: () {
          _shareForm();
        },
        label: AppText(
          text: 'SHARE',
          style: AppTextStyles.appBarTitle.copyWith(
            fontSize: 20,
            color: AppColors.whiteText,
            fontWeight: FontWeight.w500,
          ),
        ),
        icon: Icon(
          Icons.share,
          color: AppColors.whiteText,
        ),
      ),
    );
  }

  /// Share the Form externally via the platform's share dialog.
  Future<void> _shareForm() async {
    print('filePath :: $filePath');
    List<int> savedBytes = await _pdfViewerController.saveDocument();
    String dir = (await getApplicationCacheDirectory()).path;

    // Save the temporary file in the cache directory.
    File('$dir/${filePath.split('/').last}').writeAsBytesSync(savedBytes);

    List<XFile> files = [
      XFile('$dir/${filePath.split('/').last}', mimeType: 'application/pdf'),
    ];

    // Share the file.
    await Share.shareXFiles(files,
        subject: 'Form document shared successful-ly.');

    // Remove the file from the cache directory.
    File('$dir/workshop_registration.pdf').deleteSync();
  }
}
