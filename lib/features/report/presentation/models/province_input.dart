import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/province.dart';

enum ProvinceInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descProvinceCannotBeEmpty;
    }
  }
}

class ProvinceInput extends FormzInput<Province?, ProvinceInputError> {
  const ProvinceInput.pure() : super.pure(null);

  const ProvinceInput.dirty({Province? value}): super.dirty(value);

  @override
  ProvinceInputError? validator(Province? value) {
    if (value == null) return ProvinceInputError.empty;

    return null;
  }
}