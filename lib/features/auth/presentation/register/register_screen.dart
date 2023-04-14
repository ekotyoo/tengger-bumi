import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/routing/routes.dart';
import '../../../../common/widgets/app_logo.dart';
import '../../../../common/constants/constant.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  void _navigateBack(BuildContext context) => context.pop();

  void _navigateToLogin(BuildContext context) => context.goNamed(Routes.login);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: const [AppLogo()],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SWSizes.s32),
              ..._buildHeader(context),
              const SizedBox(height: SWSizes.s32),
              ..._buildRegisterInputs(context),
              const Spacer(),
              ..._buildRegisterActions(context),
              const SizedBox(height: SWSizes.s32),
            ],
          ),
        ),
      ),
    );
  }

  _buildHeader(BuildContext context) => [
        Text(
          SWStrings.labelRegister,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          SWStrings.dummyText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: kColorNeutral200),
        ),
      ];

  _buildRegisterInputs(BuildContext context) => [
        TextField(
          textInputAction: TextInputAction.next,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(hintText: SWStrings.labelName),
        ),
        const SizedBox(height: SWSizes.s16),
        TextField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          maxLines: 1,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(hintText: SWStrings.labelEmail),
        ),
        const SizedBox(height: SWSizes.s16),
        TextField(
          keyboardType: TextInputType.visiblePassword,
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: SWStrings.labelPassword,
            suffixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.visibility_off_rounded,
              ),
            ),
          ),
          obscureText: true,
          maxLines: 1,
        ),
      ];

  _buildRegisterActions(BuildContext context) => [
        ElevatedButton(
          onPressed: () {},
          child: const Text(SWStrings.labelRegister),
        ),
        const SizedBox(height: SWSizes.s16),
        OutlinedButton(
          onPressed: () => _navigateToLogin(context),
          child: const Text(SWStrings.descAlreadyHaveAccount),
        ),
      ];
}
