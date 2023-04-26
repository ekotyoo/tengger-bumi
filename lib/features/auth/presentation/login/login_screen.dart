import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/sw_button.dart';
import '../../../../utils/snackbar_utils.dart';
import '../../../../common/widgets/sw_text_field.dart';
import '../../../../common/routing/routes.dart';
import '../../../../common/widgets/app_logo.dart';
import '../../../../common/constants/constant.dart';
import './login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  void _navigateToRegister(BuildContext context) =>
      context.goNamed(Routes.register);

  void _navigateToHome(BuildContext context) => context.goNamed(Routes.home);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginControllerProvider, (previous, next) {
      next.successOrFailure.fold(
        () => () {},
        (either) => either.fold(
          (l) => showSnackbar(context,
              message: l.message, type: SnackbarType.error),
          (r) {
            showSnackbar(context, message: SWStrings.messageLoginSuccess);
            _navigateToHome(context);
          },
        ),
      );
    });

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
              ..._buildLoginActions(context, ref),
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

  _buildLoginInputs(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    return [
      SWTextField(
        action: TextInputAction.next,
        hint: SWStrings.labelEmail,
        type: SWTextFieldType.email,
        onChanged: (value) =>
            ref.read(loginControllerProvider.notifier).onEmailChange(value),
        errorText: state.emailTextInput.isPure
            ? null
            : state.emailTextInput.error?.getErrorMessage(),
      ),
      const SizedBox(height: SWSizes.s16),
      SWTextField(
        action: TextInputAction.done,
        hint: SWStrings.labelPassword,
        type: SWTextFieldType.password,
        onChanged: (value) =>
            ref.read(loginControllerProvider.notifier).onPasswordChange(value),
        errorText: state.passwordTextInput.isPure
            ? null
            : state.passwordTextInput.error?.getErrorMessage(),
      ),
    ];
  }

  _buildLoginActions(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginControllerProvider);

    return [
      SWButton(
        label: SWStrings.labelLogin,
        disabled: !state.validated,
        loading: state.isSubmitting,
        onPressed: () {
          if (!context.mounted) return;
          ref.read(loginControllerProvider.notifier).onSubmit();
        },
      ),
      const SizedBox(height: SWSizes.s16),
      OutlinedButton(
        onPressed: () => _navigateToRegister(context),
        child: const Text(SWStrings.descDidNotHaveAccount),
      ),
    ];
  }
}
