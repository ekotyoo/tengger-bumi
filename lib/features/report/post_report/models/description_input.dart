import 'package:formz/formz.dart';

enum DefaultTextInputError { empty, tooShort }

class DefaultTextInput extends FormzInput<String, DefaultTextInputError> {
  const DefaultTextInput.pure() : super.pure('');

  const DefaultTextInput.dirty({String value = ''}) : super.dirty(value);

  @override
  DefaultTextInputError? validator(String value) {
    if (value.isEmpty) return DefaultTextInputError.empty;
    if (value.length < 3) return DefaultTextInputError.tooShort;
    return null;
  }
}
