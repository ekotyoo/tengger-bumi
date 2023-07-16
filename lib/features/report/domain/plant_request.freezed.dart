// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlantRequest _$PlantRequestFromJson(Map<String, dynamic> json) {
  return _PlantRequest.fromJson(json);
}

/// @nodoc
mixin _$PlantRequest {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_images')
  List<String>? get deletedImages => throw _privateConstructorUsedError;
  @JsonKey(name: 'village_id')
  int get villageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'planting_date')
  int get plantingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'planting_count')
  int get plantingCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantRequestCopyWith<PlantRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantRequestCopyWith<$Res> {
  factory $PlantRequestCopyWith(
          PlantRequest value, $Res Function(PlantRequest) then) =
      _$PlantRequestCopyWithImpl<$Res, PlantRequest>;
  @useResult
  $Res call(
      {String name,
      String description,
      double latitude,
      double longitude,
      @JsonKey(name: 'deleted_images') List<String>? deletedImages,
      @JsonKey(name: 'village_id') int villageId,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'planting_date') int plantingDate,
      @JsonKey(name: 'planting_count') int plantingCount});
}

/// @nodoc
class _$PlantRequestCopyWithImpl<$Res, $Val extends PlantRequest>
    implements $PlantRequestCopyWith<$Res> {
  _$PlantRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? deletedImages = freezed,
    Object? villageId = null,
    Object? categoryId = null,
    Object? plantingDate = null,
    Object? plantingCount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      deletedImages: freezed == deletedImages
          ? _value.deletedImages
          : deletedImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      villageId: null == villageId
          ? _value.villageId
          : villageId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      plantingDate: null == plantingDate
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as int,
      plantingCount: null == plantingCount
          ? _value.plantingCount
          : plantingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlantRequestCopyWith<$Res>
    implements $PlantRequestCopyWith<$Res> {
  factory _$$_PlantRequestCopyWith(
          _$_PlantRequest value, $Res Function(_$_PlantRequest) then) =
      __$$_PlantRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      double latitude,
      double longitude,
      @JsonKey(name: 'deleted_images') List<String>? deletedImages,
      @JsonKey(name: 'village_id') int villageId,
      @JsonKey(name: 'category_id') int categoryId,
      @JsonKey(name: 'planting_date') int plantingDate,
      @JsonKey(name: 'planting_count') int plantingCount});
}

/// @nodoc
class __$$_PlantRequestCopyWithImpl<$Res>
    extends _$PlantRequestCopyWithImpl<$Res, _$_PlantRequest>
    implements _$$_PlantRequestCopyWith<$Res> {
  __$$_PlantRequestCopyWithImpl(
      _$_PlantRequest _value, $Res Function(_$_PlantRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? deletedImages = freezed,
    Object? villageId = null,
    Object? categoryId = null,
    Object? plantingDate = null,
    Object? plantingCount = null,
  }) {
    return _then(_$_PlantRequest(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      deletedImages: freezed == deletedImages
          ? _value._deletedImages
          : deletedImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      villageId: null == villageId
          ? _value.villageId
          : villageId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      plantingDate: null == plantingDate
          ? _value.plantingDate
          : plantingDate // ignore: cast_nullable_to_non_nullable
              as int,
      plantingCount: null == plantingCount
          ? _value.plantingCount
          : plantingCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlantRequest implements _PlantRequest {
  const _$_PlantRequest(
      {required this.name,
      required this.description,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'deleted_images') final List<String>? deletedImages,
      @JsonKey(name: 'village_id') required this.villageId,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'planting_date') required this.plantingDate,
      @JsonKey(name: 'planting_count') required this.plantingCount})
      : _deletedImages = deletedImages;

  factory _$_PlantRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PlantRequestFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final double latitude;
  @override
  final double longitude;
  final List<String>? _deletedImages;
  @override
  @JsonKey(name: 'deleted_images')
  List<String>? get deletedImages {
    final value = _deletedImages;
    if (value == null) return null;
    if (_deletedImages is EqualUnmodifiableListView) return _deletedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'village_id')
  final int villageId;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  @JsonKey(name: 'planting_date')
  final int plantingDate;
  @override
  @JsonKey(name: 'planting_count')
  final int plantingCount;

  @override
  String toString() {
    return 'PlantRequest(name: $name, description: $description, latitude: $latitude, longitude: $longitude, deletedImages: $deletedImages, villageId: $villageId, categoryId: $categoryId, plantingDate: $plantingDate, plantingCount: $plantingCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlantRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality()
                .equals(other._deletedImages, _deletedImages) &&
            (identical(other.villageId, villageId) ||
                other.villageId == villageId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.plantingDate, plantingDate) ||
                other.plantingDate == plantingDate) &&
            (identical(other.plantingCount, plantingCount) ||
                other.plantingCount == plantingCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      latitude,
      longitude,
      const DeepCollectionEquality().hash(_deletedImages),
      villageId,
      categoryId,
      plantingDate,
      plantingCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlantRequestCopyWith<_$_PlantRequest> get copyWith =>
      __$$_PlantRequestCopyWithImpl<_$_PlantRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlantRequestToJson(
      this,
    );
  }
}

abstract class _PlantRequest implements PlantRequest {
  const factory _PlantRequest(
          {required final String name,
          required final String description,
          required final double latitude,
          required final double longitude,
          @JsonKey(name: 'deleted_images') final List<String>? deletedImages,
          @JsonKey(name: 'village_id') required final int villageId,
          @JsonKey(name: 'category_id') required final int categoryId,
          @JsonKey(name: 'planting_date') required final int plantingDate,
          @JsonKey(name: 'planting_count') required final int plantingCount}) =
      _$_PlantRequest;

  factory _PlantRequest.fromJson(Map<String, dynamic> json) =
      _$_PlantRequest.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'deleted_images')
  List<String>? get deletedImages;
  @override
  @JsonKey(name: 'village_id')
  int get villageId;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  @JsonKey(name: 'planting_date')
  int get plantingDate;
  @override
  @JsonKey(name: 'planting_count')
  int get plantingCount;
  @override
  @JsonKey(ignore: true)
  _$$_PlantRequestCopyWith<_$_PlantRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
