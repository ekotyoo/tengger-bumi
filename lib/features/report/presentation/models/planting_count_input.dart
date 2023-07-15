import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/position.dart';

enum PlantingCountInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descPlantingCountCannotBeEmpty;
    }
  }
}

class PlantingCountInput extends FormzInput<int, PlantingCountInputError> {
  const PlantingCountInput.pure(): super.pure(0);

  const PlantingCountInput.dirty({required int value}): super.dirty(value);

  @override
  PlantingCountInputError? validator(int value) {
    if (value < 1) return PlantingCountInputError.empty;

    return null;
  }
}