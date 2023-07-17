import 'package:flutter/material.dart';

import '../constants/constant.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/tetenger_bumi_logo.png',
          height: SWSizes.s24,
        ),
        const SizedBox(width: SWSizes.s16),
      ],
    );
  }
}
