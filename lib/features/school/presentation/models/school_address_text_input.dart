import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';

enum SchoolAddressInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descSchoolAddressCannotBeEmpty;
    }
  }
}

class SchoolAddressInput extends FormzInput<String, SchoolAddressInputError> {
  const SchoolAddressInput.pure() : super.pure('');

  const SchoolAddressInput.dirty({String value = ''}): super.dirty(value);

  @override
  SchoolAddressInputError? validator(String value) {
    if (value.isEmpty) return SchoolAddressInputError.empty;

    return null;
  }
}