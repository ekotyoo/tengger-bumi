import 'package:flutter/material.dart';

import '../../common/constants/constant.dart';

class ReportDetailSreen extends StatelessWidget {
  const ReportDetailSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelReportDetail),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SWSizes.s16),
              child: Icon(Icons.pin_drop_rounded),
            ),
          ],
        ),
        body: Center(
          child: Text('Report Detail Screen'),
        ),
      ),
    );
  }
}
