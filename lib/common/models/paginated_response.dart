import 'package:equatable/equatable.dart';

class PaginatedResponse<T> extends Equatable {
  const PaginatedResponse({
    this.results = const [],
    this.nextPage,
    this.prevPage,
    this.currentPage = 1,
    this.lastPage = 1,
    this.count = 0,
  });

  final List<T> results;
  final int? prevPage;
  final int? nextPage;
  final int lastPage;
  final int currentPage;
  final int count;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json, {
    required List<T> results,
  }) {
    return PaginatedResponse<T>(
      results: results,
      prevPage: json['prev_page'] as int?,
      nextPage: json['next_page'] as int?,
      lastPage: json['last_page'] as int,
      count: json['count'] as int,
    );
  }

  @override
  List<Object?> get props => [
        results,
        prevPage,
        nextPage,
        lastPage,
        currentPage,
        count,
      ];
}
