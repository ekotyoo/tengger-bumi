import 'package:formz/formz.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:school_watch_semeru/features/auth/data/auth_repository.dart';

import '../models/email_text_input.dart';
import '../models/password_text_input.dart';
import '../models/name_text_input.dart';
import 'register_state.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  RegisterState build() => RegisterState(successOrFailure: none());

  void onNameChange(String value) {
    final name = NameTextInput.dirty(value: value);
    state = state.copyWith(
      nameTextInput: name,
      validated: Formz.validate([
        name,
        state.passwordTextInput,
        state.emailTextInput,
      ]),
    );
  }

  void onEmailChange(String value) {
    final email = EmailTextInput.dirty(value: value);
    state = state.copyWith(
      emailTextInput: email,
      validated: Formz.validate([
        email,
        state.passwordTextInput,
        state.nameTextInput,
      ]),
    );
  }

  void onPasswordChange(String value) {
    final password = PasswordTextInput.dirty(value: value);
    state = state.copyWith(
      passwordTextInput: password,
      validated: Formz.validate([
        password,
        state.nameTextInput,
        state.emailTextInput,
      ]),
    );
  }

  void onSubmit() async {
    state = state.copyWith(isSubmitting: true);

    final repository = ref.read(authRepositoryProvider);

    final result = await repository.register(
      name: state.nameTextInput.value,
      email: state.emailTextInput.value,
      password: state.passwordTextInput.value,
    );

    state = state.copyWith(
      successOrFailure: optionOf(result),
      isSubmitting: false,
    );
  }
}
