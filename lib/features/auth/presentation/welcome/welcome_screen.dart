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
          child: Image.asset('assets/images/sw_logo.png', width: 150, height: 150),
        ),
        const SizedBox(height: SWSizes.s32),
        Text(
          'Semeru\nSchool Watch',
          style: Theme.of(context).textTheme.displayLarge,
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
