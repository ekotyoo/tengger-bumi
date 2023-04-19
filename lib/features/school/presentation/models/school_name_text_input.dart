import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';

enum SchoolNameInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descSchoolNameCannotBeEmpty;
    }
  }
}

class SchoolNameInput extends FormzInput<String, SchoolNameInputError> {
  const SchoolNameInput.pure() : super.pure('');

  const SchoolNameInput.dirty({String value = ''}): super.dirty(value);

  @override
  SchoolNameInputError? validator(String value) {
    if (value.isEmpty) return SchoolNameInputError.empty;

    return null;
  }
}
