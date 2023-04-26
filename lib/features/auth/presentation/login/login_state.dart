import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../common/error/failure.dart';
import '../models/email_text_input.dart';
import '../models/password_login_text_input.dart';

class LoginState extends Equatable {
  const LoginState({
    this.emailTextInput = const EmailTextInput.pure(),
    this.passwordTextInput = const PasswordLoginTextInput.pure(),
    this.validated = false,
    this.isSubmitting = false,
    required this.successOrFailure,
  });

  final EmailTextInput emailTextInput;
  final PasswordLoginTextInput passwordTextInput;
  final bool validated;
  final bool isSubmitting;
  final Option<Either<Failure, Unit>> successOrFailure;

  LoginState copyWith({
    EmailTextInput? emailTextInput,
    PasswordLoginTextInput? passwordTextInput,
    bool? validated,
    bool? isSubmitting,
    Option<Either<Failure, Unit>>? successOrFailure,
  }) {
    return LoginState(
      emailTextInput: emailTextInput ?? this.emailTextInput,
      passwordTextInput: passwordTextInput ?? this.passwordTextInput,
      validated: validated ?? this.validated,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      successOrFailure: successOrFailure ?? this.successOrFailure,
    );
  }

  @override
  List<Object?> get props => [
        emailTextInput,
        passwordTextInput,
        validated,
        isSubmitting,
        successOrFailure,
      ];
}
