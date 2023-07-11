import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/routing/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  _navigateToLogin(BuildContext context) => context.pushNamed(Routes.login);

  _navigateToRegister(BuildContext context) =>
      context.pushNamed(Routes.register);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(SWSizes.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SWSizes.s56),
              ..._buildWelcomeHeader(context),
              const Spacer(),
              ..._buildWelcomeActions(context),
              const SizedBox(height: SWSizes.s32),
            ],
          ),
        ),
      ),
    );
  }

  _buildWelcomeHeader(BuildContext context) => [
        Center(
          child: Image.asset('assets/images/tetenger_bumi_logo.png', width: 300),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/filkom_logo.png', width: 50),
            Image.asset('assets/images/ub_logo.png', width: 50,),
            Image.asset('assets/images/km_logo.png', width: 50,),
            Image.asset('assets/images/mmd_ub_logo.png', width: 50,),
          ],
        ),
        const SizedBox(height: SWSizes.s32),
        Text(
          'Tetenger Bumi',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          SWStrings.appDesc,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: kColorNeutral200),
        ),
      ];

  _buildWelcomeActions(BuildContext context) => [
        ElevatedButton(
          onPressed: () => _navigateToLogin(context),
          child: const Text(SWStrings.labelLogin),
        ),
        const SizedBox(height: SWSizes.s16),
        OutlinedButton(
          onPressed: () => _navigateToRegister(context),
          child: const Text(SWStrings.labelRegister),
        ),
      ];
}
