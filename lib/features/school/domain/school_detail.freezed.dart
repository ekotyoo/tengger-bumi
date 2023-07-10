// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchoolDetail _$SchoolDetailFromJson(Map<String, dynamic> json) {
  return _SchoolDetail.fromJson(json);
}

/// @nodoc
mixin _$SchoolDetail {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  SchoolAnalysis get analysis => throw _privateConstructorUsedError;
  @JsonKey(name: 'floor_plan')
  FloorPlan get floorPlan => throw _privateConstructorUsedError;
  List<Report> get reports => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchoolDetailCopyWith<SchoolDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolDetailCopyWith<$Res> {
  factory $SchoolDetailCopyWith(
          SchoolDetail value, $Res Function(SchoolDetail) then) =
      _$SchoolDetailCopyWithImpl<$Res, SchoolDetail>;
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      SchoolAnalysis analysis,
      @JsonKey(name: 'floor_plan') FloorPlan floorPlan,
      List<Report> reports,
      String? image});

  $SchoolAnalysisCopyWith<$Res> get analysis;
  $FloorPlanCopyWith<$Res> get floorPlan;
}

/// @nodoc
class _$SchoolDetailCopyWithImpl<$Res, $Val extends SchoolDetail>
    implements $SchoolDetailCopyWith<$Res> {
  _$SchoolDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? analysis = null,
    Object? floorPlan = null,
    Object? reports = null,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as SchoolAnalysis,
      floorPlan: null == floorPlan
          ? _value.floorPlan
          : floorPlan // ignore: cast_nullable_to_non_nullable
              as FloorPlan,
      reports: null == reports
          ? _value.reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<Report>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SchoolAnalysisCopyWith<$Res> get analysis {
    return $SchoolAnalysisCopyWith<$Res>(_value.analysis, (value) {
      return _then(_value.copyWith(analysis: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FloorPlanCopyWith<$Res> get floorPlan {
    return $FloorPlanCopyWith<$Res>(_value.floorPlan, (value) {
      return _then(_value.copyWith(floorPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SchoolDetailCopyWith<$Res>
    implements $SchoolDetailCopyWith<$Res> {
  factory _$$_SchoolDetailCopyWith(
          _$_SchoolDetail value, $Res Function(_$_SchoolDetail) then) =
      __$$_SchoolDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      SchoolAnalysis analysis,
      @JsonKey(name: 'floor_plan') FloorPlan floorPlan,
      List<Report> reports,
      String? image});

  @override
  $SchoolAnalysisCopyWith<$Res> get analysis;
  @override
  $FloorPlanCopyWith<$Res> get floorPlan;
}

/// @nodoc
class __$$_SchoolDetailCopyWithImpl<$Res>
    extends _$SchoolDetailCopyWithImpl<$Res, _$_SchoolDetail>
    implements _$$_SchoolDetailCopyWith<$Res> {
  __$$_SchoolDetailCopyWithImpl(
      _$_SchoolDetail _value, $Res Function(_$_SchoolDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? analysis = null,
    Object? floorPlan = null,
    Object? reports = null,
    Object? image = freezed,
  }) {
    return _then(_$_SchoolDetail(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as SchoolAnalysis,
      floorPlan: null == floorPlan
          ? _value.floorPlan
          : floorPlan // ignore: cast_nullable_to_non_nullable
              as FloorPlan,
      reports: null == reports
          ? _value._reports
          : reports // ignore: cast_nullable_to_non_nullable
              as List<Report>,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SchoolDetail implements _SchoolDetail {
  const _$_SchoolDetail(
      {required this.id,
      required this.name,
      required this.address,
      required this.analysis,
      @JsonKey(name: 'floor_plan') required this.floorPlan,
      final List<Report> reports = const [],
      this.image})
      : _reports = reports;

  factory _$_SchoolDetail.fromJson(Map<String, dynamic> json) =>
      _$$_SchoolDetailFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  final SchoolAnalysis analysis;
  @override
  @JsonKey(name: 'floor_plan')
  final FloorPlan floorPlan;
  final List<Report> _reports;
  @override
  @JsonKey()
  List<Report> get reports {
    if (_reports is EqualUnmodifiableListView) return _reports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reports);
  }

  @override
  final String? image;

  @override
  String toString() {
    return 'SchoolDetail(id: $id, name: $name, address: $address, analysis: $analysis, floorPlan: $floorPlan, reports: $reports, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchoolDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.analysis, analysis) ||
                other.analysis == analysis) &&
            (identical(other.floorPlan, floorPlan) ||
                other.floorPlan == floorPlan) &&
            const DeepCollectionEquality().equals(other._reports, _reports) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, analysis,
      floorPlan, const DeepCollectionEquality().hash(_reports), image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchoolDetailCopyWith<_$_SchoolDetail> get copyWith =>
      __$$_SchoolDetailCopyWithImpl<_$_SchoolDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchoolDetailToJson(
      this,
    );
  }
}

abstract class _SchoolDetail implements SchoolDetail {
  const factory _SchoolDetail(
      {required final int id,
      required final String name,
      required final String address,
      required final SchoolAnalysis analysis,
      @JsonKey(name: 'floor_plan') required final FloorPlan floorPlan,
      final List<Report> reports,
      final String? image}) = _$_SchoolDetail;

  factory _SchoolDetail.fromJson(Map<String, dynamic> json) =
      _$_SchoolDetail.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  SchoolAnalysis get analysis;
  @override
  @JsonKey(name: 'floor_plan')
  FloorPlan get floorPlan;
  @override
  List<Report> get reports;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_SchoolDetailCopyWith<_$_SchoolDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
