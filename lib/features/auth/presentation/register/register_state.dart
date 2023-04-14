import 'package:equatable/equatable.dart';

import '../models/name_text_input.dart';
import '../models/email_text_input.dart';
import '../models/password_text_input.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.nameTextInput = const NameTextInput.pure(),
    this.emailTextInput = const EmailTextInput.pure(),
    this.passwordTextInput = const PasswordTextInput.pure(),
    this.status = false,
  });

  final NameTextInput nameTextInput;
  final EmailTextInput emailTextInput;
  final PasswordTextInput passwordTextInput;
  final bool status;

  RegisterState copyWith({
    NameTextInput? nameTextInput,
    EmailTextInput? emailTextInput,
    PasswordTextInput? passwordTextInput,
    bool? status,
  }) {
    return RegisterState(
      nameTextInput: nameTextInput ?? this.nameTextInput,
      emailTextInput: emailTextInput ?? this.emailTextInput,
      passwordTextInput: passwordTextInput ?? this.passwordTextInput,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        nameTextInput,
        emailTextInput,
        passwordTextInput,
        status,
      ];
}
