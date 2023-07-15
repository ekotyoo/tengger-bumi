import 'package:freezed_annotation/freezed_annotation.dart';

part 'regency.freezed.dart';

part 'regency.g.dart';

@freezed
class Regency with _$Regency {
  const factory Regency({
    required int id,
    required String name,
    @JsonKey(name: 'province_id') required int provinceId,
  }) = _Regency;

  factory Regency.fromJson(Map<String, Object?> json) => _$RegencyFromJson(json);
}