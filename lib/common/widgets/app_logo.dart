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
          width: SWSizes.s16,
          height: SWSizes.s16,
        ),
        const SizedBox(width: SWSizes.s4),
        Text(
          SWStrings.appNameShort,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).primaryColor),
        ),
        const SizedBox(width: SWSizes.s16),
      ],
    );
  }
}
