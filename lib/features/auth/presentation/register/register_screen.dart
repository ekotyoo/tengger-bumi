import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/sw_button.dart';
import '../../../../utils/snackbar_utils.dart';
import '../../../../common/widgets/sw_text_field.dart';
import 'register_controller.dart';
import '../../../../common/routing/routes.dart';
import '../../../../common/widgets/app_logo.dart';
import '../../../../common/constants/constant.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  void _navigateToLogin(BuildContext context) => context.goNamed(Routes.login);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (previous, next) {
      next.successOrFailure.fold(
        () {},
        (either) => either.fold(
          (l) => showSnackbar(context,
              message: l.message, type: SnackbarType.error),
          (r) {
            showSnackbar(context, message: SWStrings.messageRegisterSuccess);
            context.goNamed(
              Routes.emailVerification,
              extra: next.emailTextInput.value,
            );
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: SWSizes.s32),
              ..._buildHeader(context),
              const SizedBox(height: SWSizes.s32),
              ..._buildRegisterInputs(context, ref),
              const SizedBox(height: SWSizes.s8),
              TextButton(
                onPressed: () => context.pushNamed(Routes.emailVerification),
                child: const Text(SWStrings.labelEmailVerification),
              ),
              const Spacer(),
              ..._buildRegisterActions(context, ref),
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

  _buildRegisterInputs(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);

    return [
      SWTextField(
        action: TextInputAction.next,
        hint: SWStrings.labelName,
        onChanged: (value) =>
            ref.read(registerControllerProvider.notifier).onNameChange(value),
        errorText: state.nameTextInput.isPure
            ? null
            : state.nameTextInput.error?.getErrorMessage(),
      ),
      const SizedBox(height: SWSizes.s16),
      SWTextField(
        action: TextInputAction.next,
        hint: SWStrings.labelEmail,
        onChanged: (value) =>
            ref.read(registerControllerProvider.notifier).onEmailChange(value),
        type: SWTextFieldType.email,
        errorText: state.emailTextInput.isPure
            ? null
            : state.emailTextInput.error?.getErrorMessage(),
      ),
      const SizedBox(height: SWSizes.s16),
      SWTextField(
        action: TextInputAction.done,
        hint: SWStrings.labelPassword,
        onChanged: (value) => ref
            .read(registerControllerProvider.notifier)
            .onPasswordChange(value),
        type: SWTextFieldType.password,
        errorText: state.passwordTextInput.isPure
            ? null
            : state.passwordTextInput.error?.getErrorMessage(),
      ),
    ];
  }

  _buildRegisterActions(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerControllerProvider);

    return [
      SWButton(
        label: SWStrings.labelRegister,
        loading: state.isSubmitting,
        disabled: !state.validated,
        onPressed: () =>
            ref.read(registerControllerProvider.notifier).onSubmit(),
      ),
      const SizedBox(height: SWSizes.s16),
      OutlinedButton(
        onPressed: () => _navigateToLogin(context),
        child: const Text(SWStrings.descAlreadyHaveAccount),
      ),
    ];
  }
}
