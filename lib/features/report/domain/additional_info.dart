import 'package:equatable/equatable.dart';

class AdditionalInfo extends Equatable {
  const AdditionalInfo({required this.label, required this.information});

  final String label;
  final String information;

  @override
  List<Object> get props => [label, information];
}