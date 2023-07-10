// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchoolRequest _$SchoolRequestFromJson(Map<String, dynamic> json) {
  return _SchoolRequest.fromJson(json);
}

/// @nodoc
mixin _$SchoolRequest {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor_plan')
  FloorPlan get floorPlan => throw _privateConstructorUsedError;
  Position get centroid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchoolRequestCopyWith<SchoolRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolRequestCopyWith<$Res> {
  factory $SchoolRequestCopyWith(
          SchoolRequest value, $Res Function(SchoolRequest) then) =
      _$SchoolRequestCopyWithImpl<$Res, SchoolRequest>;
  @useResult
  $Res call(
      {String name,
      String address,
      @JsonKey(name: 'floor_plan') FloorPlan floorPlan,
      Position centroid});

  $FloorPlanCopyWith<$Res> get floorPlan;
  $PositionCopyWith<$Res> get centroid;
}

/// @nodoc
class _$SchoolRequestCopyWithImpl<$Res, $Val extends SchoolRequest>
    implements $SchoolRequestCopyWith<$Res> {
  _$SchoolRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? floorPlan = null,
    Object? centroid = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      floorPlan: null == floorPlan
          ? _value.floorPlan
          : floorPlan // ignore: cast_nullable_to_non_nullable
              as FloorPlan,
      centroid: null == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Position,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FloorPlanCopyWith<$Res> get floorPlan {
    return $FloorPlanCopyWith<$Res>(_value.floorPlan, (value) {
      return _then(_value.copyWith(floorPlan: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res> get centroid {
    return $PositionCopyWith<$Res>(_value.centroid, (value) {
      return _then(_value.copyWith(centroid: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SchoolRequestCopyWith<$Res>
    implements $SchoolRequestCopyWith<$Res> {
  factory _$$_SchoolRequestCopyWith(
          _$_SchoolRequest value, $Res Function(_$_SchoolRequest) then) =
      __$$_SchoolRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      @JsonKey(name: 'floor_plan') FloorPlan floorPlan,
      Position centroid});

  @override
  $FloorPlanCopyWith<$Res> get floorPlan;
  @override
  $PositionCopyWith<$Res> get centroid;
}

/// @nodoc
class __$$_SchoolRequestCopyWithImpl<$Res>
    extends _$SchoolRequestCopyWithImpl<$Res, _$_SchoolRequest>
    implements _$$_SchoolRequestCopyWith<$Res> {
  __$$_SchoolRequestCopyWithImpl(
      _$_SchoolRequest _value, $Res Function(_$_SchoolRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? floorPlan = null,
    Object? centroid = null,
  }) {
    return _then(_$_SchoolRequest(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      floorPlan: null == floorPlan
          ? _value.floorPlan
          : floorPlan // ignore: cast_nullable_to_non_nullable
              as FloorPlan,
      centroid: null == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Position,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SchoolRequest implements _SchoolRequest {
  const _$_SchoolRequest(
      {required this.name,
      required this.address,
      @JsonKey(name: 'floor_plan') required this.floorPlan,
      required this.centroid});

  factory _$_SchoolRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SchoolRequestFromJson(json);

  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey(name: 'floor_plan')
  final FloorPlan floorPlan;
  @override
  final Position centroid;

  @override
  String toString() {
    return 'SchoolRequest(name: $name, address: $address, floorPlan: $floorPlan, centroid: $centroid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchoolRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.floorPlan, floorPlan) ||
                other.floorPlan == floorPlan) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, address, floorPlan, centroid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchoolRequestCopyWith<_$_SchoolRequest> get copyWith =>
      __$$_SchoolRequestCopyWithImpl<_$_SchoolRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchoolRequestToJson(
      this,
    );
  }
}

abstract class _SchoolRequest implements SchoolRequest {
  const factory _SchoolRequest(
      {required final String name,
      required final String address,
      @JsonKey(name: 'floor_plan') required final FloorPlan floorPlan,
      required final Position centroid}) = _$_SchoolRequest;

  factory _SchoolRequest.fromJson(Map<String, dynamic> json) =
      _$_SchoolRequest.fromJson;

  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(name: 'floor_plan')
  FloorPlan get floorPlan;
  @override
  Position get centroid;
  @override
  @JsonKey(ignore: true)
  _$$_SchoolRequestCopyWith<_$_SchoolRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
