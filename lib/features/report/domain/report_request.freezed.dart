// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportRequest _$ReportRequestFromJson(Map<String, dynamic> json) {
  return _ReportRequest.fromJson(json);
}

/// @nodoc
mixin _$ReportRequest {
  @JsonKey(name: 'school_id')
  int get schoolId => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_infos')
  List<AdditionalInfo>? get additionalInfos =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_images')
  List<String>? get deletedImages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportRequestCopyWith<ReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportRequestCopyWith<$Res> {
  factory $ReportRequestCopyWith(
          ReportRequest value, $Res Function(ReportRequest) then) =
      _$ReportRequestCopyWithImpl<$Res, ReportRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'school_id') int schoolId,
      @JsonKey(name: 'room_id') int roomId,
      @JsonKey(name: 'category_id') int categoryId,
      String description,
      double latitude,
      double longitude,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'additional_infos') List<AdditionalInfo>? additionalInfos,
      @JsonKey(name: 'deleted_images') List<String>? deletedImages});
}

/// @nodoc
class _$ReportRequestCopyWithImpl<$Res, $Val extends ReportRequest>
    implements $ReportRequestCopyWith<$Res> {
  _$ReportRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolId = null,
    Object? roomId = null,
    Object? categoryId = null,
    Object? description = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isActive = freezed,
    Object? additionalInfos = freezed,
    Object? deletedImages = freezed,
  }) {
    return _then(_value.copyWith(
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      additionalInfos: freezed == additionalInfos
          ? _value.additionalInfos
          : additionalInfos // ignore: cast_nullable_to_non_nullable
              as List<AdditionalInfo>?,
      deletedImages: freezed == deletedImages
          ? _value.deletedImages
          : deletedImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportRequestCopyWith<$Res>
    implements $ReportRequestCopyWith<$Res> {
  factory _$$_ReportRequestCopyWith(
          _$_ReportRequest value, $Res Function(_$_ReportRequest) then) =
      __$$_ReportRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'school_id') int schoolId,
      @JsonKey(name: 'room_id') int roomId,
      @JsonKey(name: 'category_id') int categoryId,
      String description,
      double latitude,
      double longitude,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'additional_infos') List<AdditionalInfo>? additionalInfos,
      @JsonKey(name: 'deleted_images') List<String>? deletedImages});
}

/// @nodoc
class __$$_ReportRequestCopyWithImpl<$Res>
    extends _$ReportRequestCopyWithImpl<$Res, _$_ReportRequest>
    implements _$$_ReportRequestCopyWith<$Res> {
  __$$_ReportRequestCopyWithImpl(
      _$_ReportRequest _value, $Res Function(_$_ReportRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolId = null,
    Object? roomId = null,
    Object? categoryId = null,
    Object? description = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? isActive = freezed,
    Object? additionalInfos = freezed,
    Object? deletedImages = freezed,
  }) {
    return _then(_$_ReportRequest(
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
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
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      additionalInfos: freezed == additionalInfos
          ? _value._additionalInfos
          : additionalInfos // ignore: cast_nullable_to_non_nullable
              as List<AdditionalInfo>?,
      deletedImages: freezed == deletedImages
          ? _value._deletedImages
          : deletedImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportRequest implements _ReportRequest {
  const _$_ReportRequest(
      {@JsonKey(name: 'school_id')
          required this.schoolId,
      @JsonKey(name: 'room_id')
          required this.roomId,
      @JsonKey(name: 'category_id')
          required this.categoryId,
      required this.description,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'is_active')
          this.isActive,
      @JsonKey(name: 'additional_infos')
          final List<AdditionalInfo>? additionalInfos,
      @JsonKey(name: 'deleted_images')
          final List<String>? deletedImages})
      : _additionalInfos = additionalInfos,
        _deletedImages = deletedImages;

  factory _$_ReportRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ReportRequestFromJson(json);

  @override
  @JsonKey(name: 'school_id')
  final int schoolId;
  @override
  @JsonKey(name: 'room_id')
  final int roomId;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;
  @override
  final String description;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  final List<AdditionalInfo>? _additionalInfos;
  @override
  @JsonKey(name: 'additional_infos')
  List<AdditionalInfo>? get additionalInfos {
    final value = _additionalInfos;
    if (value == null) return null;
    if (_additionalInfos is EqualUnmodifiableListView) return _additionalInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  String toString() {
    return 'ReportRequest(schoolId: $schoolId, roomId: $roomId, categoryId: $categoryId, description: $description, latitude: $latitude, longitude: $longitude, isActive: $isActive, additionalInfos: $additionalInfos, deletedImages: $deletedImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportRequest &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._additionalInfos, _additionalInfos) &&
            const DeepCollectionEquality()
                .equals(other._deletedImages, _deletedImages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      schoolId,
      roomId,
      categoryId,
      description,
      latitude,
      longitude,
      isActive,
      const DeepCollectionEquality().hash(_additionalInfos),
      const DeepCollectionEquality().hash(_deletedImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      __$$_ReportRequestCopyWithImpl<_$_ReportRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportRequestToJson(
      this,
    );
  }
}

abstract class _ReportRequest implements ReportRequest {
  const factory _ReportRequest(
      {@JsonKey(name: 'school_id')
          required final int schoolId,
      @JsonKey(name: 'room_id')
          required final int roomId,
      @JsonKey(name: 'category_id')
          required final int categoryId,
      required final String description,
      required final double latitude,
      required final double longitude,
      @JsonKey(name: 'is_active')
          final bool? isActive,
      @JsonKey(name: 'additional_infos')
          final List<AdditionalInfo>? additionalInfos,
      @JsonKey(name: 'deleted_images')
          final List<String>? deletedImages}) = _$_ReportRequest;

  factory _ReportRequest.fromJson(Map<String, dynamic> json) =
      _$_ReportRequest.fromJson;

  @override
  @JsonKey(name: 'school_id')
  int get schoolId;
  @override
  @JsonKey(name: 'room_id')
  int get roomId;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;
  @override
  String get description;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'additional_infos')
  List<AdditionalInfo>? get additionalInfos;
  @override
  @JsonKey(name: 'deleted_images')
  List<String>? get deletedImages;
  @override
  @JsonKey(ignore: true)
  _$$_ReportRequestCopyWith<_$_ReportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
