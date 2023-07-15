import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/district.dart';

enum DistrictInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descDistrictCannotBeEmpty;
    }
  }
}

class DistrictInput extends FormzInput<District?, DistrictInputError> {
  const DistrictInput.pure() : super.pure(null);

  const DistrictInput.dirty({District? value}): super.dirty(value);

  @override
  DistrictInputError? validator(District? value) {
    if (value == null) return DistrictInputError.empty;

    return null;
  }
}