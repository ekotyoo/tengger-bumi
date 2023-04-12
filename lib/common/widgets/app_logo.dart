import 'package:flutter/material.dart';

import '../constants/constant.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: SWSizes.s8,
          backgroundColor: Colors.orange,
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
