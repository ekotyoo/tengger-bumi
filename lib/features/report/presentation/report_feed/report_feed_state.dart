import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/category.dart';
import '../../domain/plant.dart';

part 'report_feed_state.freezed.dart';

@freezed
class ReportFeedState with _$ReportFeedState {
  const factory ReportFeedState({
    @Default([]) List<Plant> reports,
    @Default([]) List<Category> categories,
    String? successMessage,
    String? errorMessage,
  }) = _ReportFeedState;
}
