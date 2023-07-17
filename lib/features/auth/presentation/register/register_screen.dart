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
    ref.listen(
      registerControllerProvider.select((value) => value.errorMessage),
          (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next, type: SnackbarType.error);
        }
        ref.read(registerControllerProvider.notifier).setErrorMessage(null);
      },
    );

    ref.listen(
      registerControllerProvider.select((value) => value.successMessage),
          (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next);
          final email = ref.read(registerControllerProvider).emailTextInput.value;

          context.goNamed(
            Routes.emailVerification,
            extra: email,
          );
        }
        ref.read(registerControllerProvider.notifier).setSuccessMessage(null);
      },
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
              const SizedBox(height: SWSizes.s32),
              ..._buildRegisterActions(context, ref),
              const Spacer(),
              ..._buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildHeader(BuildContext context) => [
        Center(
          child: Column(
            children: [
              Image.asset('assets/images/tetenger_bumi_logo.png'),
              const SizedBox(height: SWSizes.s32),
              Text(
                SWStrings.labelRegister,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
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
          onPressed: () => _navigateToLogin(context),
          child: const Text(SWStrings.descAlreadyHaveAccount),
        ),
      ),
    ];
  }

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
