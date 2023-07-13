import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:school_watch_semeru/features/auth/presentation/models/email_text_input.dart';

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      loginControllerProvider.select((value) => value.shouldVerifyEmail),
      (previous, shouldVerifyEmail) {
        if (shouldVerifyEmail) {
          final email = (ref.read(loginControllerProvider).emailTextInput as EmailTextInput).value;
          context.pushNamed(Routes.emailVerification, extra: email);
          ref.read(loginControllerProvider.notifier).setShouldVerifyEmail(false);
        }
      },
    );

    ref.listen(
      loginControllerProvider.select((value) => value.errorMessage),
      (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next, type: SnackbarType.error);
        }
        ref.read(loginControllerProvider.notifier).setErrorMessage(null);
      },
    );

    ref.listen(
      loginControllerProvider.select((value) => value.successMessage),
      (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next);
        }
        ref.read(loginControllerProvider.notifier).setSuccessMessage(null);
      },
    );

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
              const SizedBox(height: SWSizes.s32),
              ..._buildLoginActions(context, ref),
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
                SWStrings.labelLogin,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
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
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                )
            )
        ),
        onPressed: () => _navigateToRegister(context),
        child: const Text(SWStrings.descDidNotHaveAccount),
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
