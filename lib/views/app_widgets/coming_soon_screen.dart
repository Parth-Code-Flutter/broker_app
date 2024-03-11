import 'package:broker_app/utils/ui/app_text_styles.dart';
import 'package:broker_app/views/app_widgets/app_scaffold.dart';
import 'package:broker_app/views/app_widgets/app_text.dart';
import 'package:broker_app/views/app_widgets/primary_app_bar.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatefulWidget {
  const ComingSoon({
    super.key,
    this.primary = false,
  });

  final bool primary;

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: PrimaryAppBar.appBar(
        title: '',
        primaryPage: widget.primary,
      ),
      body: Center(
        child: AppText(
          text: 'Coming Soon',
          style: AppTextStyles.defaultText,
        ),
      ),
    );
  }
}
