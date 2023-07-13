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
              const SizedBox(height: SWSizes.s24),
              ..._buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildWelcomeHeader(BuildContext context) => [
        Center(
          child: Image.asset('assets/images/tetenger_bumi_logo.png'),
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
        SizedBox(
          height: 48,
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )
                )
            ),
            onPressed: () => _navigateToLogin(context),
            child: const Text(SWStrings.labelLogin),
          ),
        ),
        const SizedBox(height: SWSizes.s16),
        SizedBox(
          height: 48,
          child: OutlinedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    )
                )
            ),
            onPressed: () => _navigateToRegister(context),
            child: const Text(SWStrings.labelRegister),
          ),
        ),
      ];

  _buildFooter(BuildContext context) => [
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
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
  ];
}
