import 'package:equatable/equatable.dart';
import '../models/email_text_input.dart';
import '../models/password_login_text_input.dart';

class LoginState extends Equatable {
  const LoginState({
    this.emailTextInput = const EmailTextInput.pure(),
    this.passwordTextInput = const PasswordLoginTextInput.pure(),
    this.status = false,
  });

  final EmailTextInput emailTextInput;
  final PasswordLoginTextInput passwordTextInput;
  final bool status;

  LoginState copyWith({
    EmailTextInput? emailTextInput,
    PasswordLoginTextInput? passwordTextInput,
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
