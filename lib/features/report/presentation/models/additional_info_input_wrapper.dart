import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'information_text_input.dart';
import 'label_text_input.dart';

class AdditionalInfoInputWrapper extends Equatable {
  const AdditionalInfoInputWrapper({
    required this.labelInput,
    required this.informationInput,
    required this.key,
  });

  final LabelTextInput labelInput;
  final InformationTextInput informationInput;
  final UniqueKey key;

  AdditionalInfoInputWrapper copyWith({
    LabelTextInput? labelInput,
    InformationTextInput? informationInput,
    UniqueKey? key,
  }) {
    return AdditionalInfoInputWrapper(
      labelInput: labelInput ?? this.labelInput,
      informationInput: informationInput ?? this.informationInput,
      key: key ?? this.key,
    );
  }

  @override
  List<Object> get props => [labelInput, informationInput, key];
}
