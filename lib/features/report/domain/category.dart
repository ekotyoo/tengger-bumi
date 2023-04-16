import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({required this.id, required this.label});

  final String id;
  final String label;

  @override
  List<Object> get props => [id, label];
}