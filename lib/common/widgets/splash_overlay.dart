import 'package:flutter/material.dart';

import '../constants/constant.dart';

class SplashOverlay extends StatelessWidget {
  const SplashOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        // backgroundColor: Theme.of(context).primaryColor,
        // body: Center(
        //   child: CircleAvatar(
        //     radius: SWSizes.s80,
        //     backgroundColor: Theme.of(context).colorScheme.onPrimary,
        //     child: Image.asset('assets/images/tetenger_bumi_logo.png'),
        //   ),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image.asset('assets/images/tetenger_bumi_logo.png')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/filkom_logo.png'),
                const SizedBox(width: 8),
                Image.asset('assets/images/ub_logo.png'),
                const SizedBox(width: 8),
                Image.asset('assets/images/km_logo.png'),
                const SizedBox(width: 8),
                Image.asset('assets/images/mmd_ub_logo.png'),

              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
