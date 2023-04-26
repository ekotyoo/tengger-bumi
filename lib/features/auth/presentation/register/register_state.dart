import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../common/error/failure.dart';
import '../models/name_text_input.dart';
import '../models/email_text_input.dart';
import '../models/password_text_input.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.nameTextInput = const NameTextInput.pure(),
    this.emailTextInput = const EmailTextInput.pure(),
    this.passwordTextInput = const PasswordTextInput.pure(),
    this.validated = false,
    this.isSubmitting = false,
    required this.successOrFailure,
  });

  final NameTextInput nameTextInput;
  final EmailTextInput emailTextInput;
  final PasswordTextInput passwordTextInput;
  final bool validated;
  final bool isSubmitting;
  final Option<Either<Failure, Unit>> successOrFailure;

  RegisterState copyWith({
    NameTextInput? nameTextInput,
    EmailTextInput? emailTextInput,
    PasswordTextInput? passwordTextInput,
    bool? validated,
    bool? isSubmitting,
    Option<Either<Failure, Unit>>? successOrFailure,
  }) {
    return RegisterState(
      nameTextInput: nameTextInput ?? this.nameTextInput,
      emailTextInput: emailTextInput ?? this.emailTextInput,
      passwordTextInput: passwordTextInput ?? this.passwordTextInput,
      validated: validated ?? this.validated,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      successOrFailure: successOrFailure ?? this.successOrFailure,
    );
  }

  @override
  List<Object?> get props => [
        nameTextInput,
        emailTextInput,
        passwordTextInput,
        validated,
        isSubmitting,
        successOrFailure,
      ];
}
