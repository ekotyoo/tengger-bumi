import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';
import '../models/email_text_input.dart';
import '../models/password_login_text_input.dart';
import './login_state.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  LoginState build() => LoginState(
    successOrFailure: none(),
  );

  void onEmailChange(value) {
    final email = EmailTextInput.dirty(value: value);
    state = state.copyWith(
      emailTextInput: email,
      validated: Formz.validate([email, state.passwordTextInput]),
    );
  }

  void onPasswordChange(value) {
    final password = PasswordLoginTextInput.dirty(value: value);
    state = state.copyWith(
      passwordTextInput: password,
      validated: Formz.validate([password, state.emailTextInput]),
    );
  }

  Future<void> onSubmit() async {
    state = state.copyWith(isSubmitting: true);
    final repository = ref.read(authRepositoryProvider);

    final result = await repository.login(
      email: state.emailTextInput.value,
      password: state.passwordTextInput.value,
    );

    state = state.copyWith(successOrFailure: optionOf(result), isSubmitting: false);
  }
}
