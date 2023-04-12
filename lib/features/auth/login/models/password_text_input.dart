import 'package:formz/formz.dart';
import 'package:school_watch_semeru/utils/string_validator.dart';

enum PasswordTextInputError {
  empty,
  invalid,
  tooShort;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return 'Password tidak boleh kosong';
      case invalid:
        return 'Password minimal memiliki 1 karakter dan 1 simbol';
      case tooShort:
        return 'Password minimal terdiri dari 6 karakter';
    }
  }
}

class PasswordTextInput extends FormzInput<String, PasswordTextInputError> {
  const PasswordTextInput.pure() : super.pure('');

  const PasswordTextInput.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordTextInputError? validator(String value) {
    if (!PasswordInputValidator().isValid(value)) {
      return PasswordTextInputError.invalid;
    }
    if (!MinLengthInputValidator(6).isValid(value)) {
      return PasswordTextInputError.tooShort;
    }
    if (!NotEmptyInputValidator().isValid(value)) {
      return PasswordTextInputError.empty;
    }

    return null;
  }
}
