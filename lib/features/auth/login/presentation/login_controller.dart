import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:school_watch_semeru/features/auth/login/models/email_text_input.dart';
import 'package:school_watch_semeru/features/auth/login/models/password_text_input.dart';
import 'package:school_watch_semeru/features/auth/login/presentation/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(const LoginState());

  void onEmailChange(value) {
    final email = EmailTextInput.dirty(value: value);
    state = state.copyWith(
      emailTextInput: email,
      status: Formz.validate([email, state.passwordTextInput]),
    );
  }

  void onPasswordChange(value) {
    final password = PasswordTextInput.dirty(value: value);
    state = state.copyWith(
      passwordTextInput: password,
      status: Formz.validate([password, state.emailTextInput]),
    );
  }
}

final loginControllerProvider =
    StateNotifierProvider.autoDispose<LoginController, LoginState>(
  (ref) => LoginController(),
);
