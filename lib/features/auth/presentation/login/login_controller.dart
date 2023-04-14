import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import '../../models/email_text_input.dart';
import '../../models/password_text_input.dart';
import './login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(const LoginState());

  void onEmailChange(value) {
    final email = EmailTextInput.dirty(value: value);
    state = state.copyWith(emailTextInput: email);
  }

  void onPasswordChange(value) {
    final password = PasswordTextInput.dirty(value: value);
    state = state.copyWith(passwordTextInput: password);
  }

  void onSubmit() {
    state = state.copyWith(
      emailTextInput: EmailTextInput.dirty(value: state.emailTextInput.value),
      passwordTextInput: PasswordTextInput.dirty(value: state.passwordTextInput.value),
      status: Formz.validate([state.emailTextInput, state.passwordTextInput]),
    );
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>(
  (ref) => LoginController(),
);
