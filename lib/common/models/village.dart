import 'package:freezed_annotation/freezed_annotation.dart';

part 'village.freezed.dart';

part 'village.g.dart';

@freezed
class Village with _$Village {
  const factory Village({
    required int id,
    required String name,
    @JsonKey(name: 'district_id') required int districtId,
  }) = _Village;

  factory Village.fromJson(Map<String, Object?> json) => _$VillageFromJson(json);
}