import 'package:formz/formz.dart';

import '../../../../common/constants/constant.dart';
import '../../domain/category.dart';

enum CategoryOptionInputError {
  empty;

  String getErrorMessage() {
    switch (this) {
      case empty:
        return SWStrings.descCategoryCannotBeEmpty;
    }
  }
}

class CategoryOptionInput extends FormzInput<Category?, CategoryOptionInputError> {
  const CategoryOptionInput.pure() : super.pure(null);

  const CategoryOptionInput.dirty({Category? value}): super.dirty(value);

  @override
  CategoryOptionInputError? validator(Category? value) {
    if (value == null) return CategoryOptionInputError.empty;

    return null;
  }

}