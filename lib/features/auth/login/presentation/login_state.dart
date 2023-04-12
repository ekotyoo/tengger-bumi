import 'package:equatable/equatable.dart';
import 'package:school_watch_semeru/features/auth/login/models/email_text_input.dart';
import 'package:school_watch_semeru/features/auth/login/models/password_text_input.dart';

class LoginState extends Equatable {
  const LoginState({
    this.emailTextInput = const EmailTextInput.pure(),
    this.passwordTextInput = const PasswordTextInput.pure(),
    this.status = false,
  });

  final EmailTextInput emailTextInput;
  final PasswordTextInput passwordTextInput;
  final bool status;

  LoginState copyWith({
    EmailTextInput? emailTextInput,
    PasswordTextInput? passwordTextInput,
    bool? status,
  }) {
    return LoginState(
      emailTextInput: emailTextInput ?? this.emailTextInput,
      passwordTextInput: passwordTextInput ?? this.passwordTextInput,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [emailTextInput, passwordTextInput, status];
}
