import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../models/email_text_input.dart';
import '../models/password_text_input.dart';
import '../models/name_text_input.dart';
import 'register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(const RegisterState());

  void onNameChange(String value) {
    final name = NameTextInput.dirty(value: value);
    state = state.copyWith(nameTextInput: name);
  }

  void onEmailChange(String value) {
    final email = EmailTextInput.dirty(value: value);
    state = state.copyWith(emailTextInput: email);
  }

  void onPasswordChange(String value) {
    final password = PasswordTextInput.dirty(value: value);
    state = state.copyWith(passwordTextInput: password);
  }

  void onSubmit() {
    state = state.copyWith(
      nameTextInput: NameTextInput.dirty(value: state.nameTextInput.value),
      emailTextInput: EmailTextInput.dirty(value: state.emailTextInput.value),
      passwordTextInput: PasswordTextInput.dirty(
        value: state.passwordTextInput.value,
      ),
      status: Formz.validate([
        state.nameTextInput,
        state.emailTextInput,
        state.passwordTextInput,
      ]),
    );
  }
}

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>(
  (ref) => RegisterController(),
);
