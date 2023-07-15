import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';

part 'district.g.dart';

@freezed
class District with _$District {
  const factory District({
    required int id,
    required String name,
    @JsonKey(name: 'regency_id') required int regencyId,
  }) = _District;

  factory District.fromJson(Map<String, Object?> json) => _$DistrictFromJson(json);
}