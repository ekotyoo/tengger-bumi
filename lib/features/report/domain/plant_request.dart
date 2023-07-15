import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_request.freezed.dart';

part 'plant_request.g.dart';

@freezed
class PlantRequest with _$PlantRequest {
  const factory PlantRequest({
    required String name,
    required String description,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'deleted_images') List<String>? deletedImages,
    @JsonKey(name: 'village_id') required int villageId,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'planting_date') required int plantingDate,
    @JsonKey(name: 'planting_count') required int plantingCount
  }) = _PlantRequest;

  factory PlantRequest.fromJson(Map<String, Object?> json) => _$PlantRequestFromJson(json);
}