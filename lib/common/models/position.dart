import 'package:freezed_annotation/freezed_annotation.dart';

part 'position.freezed.dart';

part 'position.g.dart';

class DoubleSerializer implements JsonConverter<double, dynamic> {
  const DoubleSerializer();

  @override
  double fromJson(dynamic value) => value is double ? value : double.parse(value);

  @override
  String toJson(double value) => value.toString();
}

@freezed
class Position with _$Position {
  const factory Position({
    @DoubleSerializer() required double latitude,
    @DoubleSerializer() required double longitude,
  }) = _Position;

  factory Position.fromJson(Map<String, Object?> json) => _$PositionFromJson(json);
}
