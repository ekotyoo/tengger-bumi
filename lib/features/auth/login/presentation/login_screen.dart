import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_watch_semeru/common/widgets/sw_text_field.dart';
import 'package:school_watch_semeru/features/auth/login/presentation/login_controller.dart';

import '../../../../common/routing/routes.dart';
import '../../../../common/widgets/app_logo.dart';
import '../../../../common/constants/constant.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void _navigateToRegister(BuildContext context) =>
      context.goNamed(Routes.register);

  void _navigateToHome(BuildContext context) => context.goNamed(Routes.home);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: const [AppLogo()],
        ),
        body: Padding(
          padding: const EdgeInsets.all(SWSizes.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SWSizes.s32),
              ..._buildHeader(context),
              const SizedBox(height: SWSizes.s32),
              ..._buildLoginInputs(context, ref),
              const Spacer(),
              ..._buildLoginActions(context),
              const SizedBox(height: SWSizes.s32),
            ],
          ),
        ),
      ),
    );
  }

  _buildHeader(BuildContext context) => [
        Text(
          SWStrings.labelLogin,
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

  _buildLoginInputs(BuildContext context, WidgetRef ref) => [
        SWTextField(
          action: TextInputAction.next,
          hint: SWStrings.labelEmail,
          type: SWTextFieldType.email,
          onChanged: (value) =>
              ref.read(loginControllerProvider.notifier).onEmailChange(value),
          errorText: ref
              .watch(loginControllerProvider)
              .emailTextInput
              .error
              ?.getErrorMessage(),
        ),
        const SizedBox(height: SWSizes.s16),
        SWTextField(
          action: TextInputAction.done,
          hint: SWStrings.labelPassword,
          type: SWTextFieldType.password,
          onChanged: (value) => ref
              .read(loginControllerProvider.notifier)
              .onPasswordChange(value),
          errorText: ref
              .watch(loginControllerProvider)
              .passwordTextInput
              .error
              ?.getErrorMessage(),
        ),
      ];

  _buildLoginActions(BuildContext context) => [
        ElevatedButton(
          onPressed: () => _navigateToHome(context),
          child: const Text(SWStrings.labelLogin),
        ),
        const SizedBox(height: SWSizes.s16),
        OutlinedButton(
          onPressed: () => _navigateToRegister(context),
          child: const Text(SWStrings.descDidNotHaveAccount),
        ),
      ];
}
