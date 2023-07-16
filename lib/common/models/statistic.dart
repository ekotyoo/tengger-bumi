import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistic.freezed.dart';

part 'statistic.g.dart';

@freezed
class Statistic with _$Statistic {
  const factory Statistic({
    required int id,
    required String name,
    @JsonKey(name: 'icon_path') required String icon,
    required int count,
  }) = _Statistic;

  factory Statistic.fromJson(Map<String, Object?> json) => _$StatisticFromJson(json);
}