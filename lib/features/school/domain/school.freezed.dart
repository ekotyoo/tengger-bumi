// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

School _$SchoolFromJson(Map<String, dynamic> json) {
  return _School.fromJson(json);
}

/// @nodoc
mixin _$School {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  SchoolAnalysis get analysis => throw _privateConstructorUsedError;
  Position get centroid => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_edit', defaultValue: false)
  bool get allowEdit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchoolCopyWith<School> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolCopyWith<$Res> {
  factory $SchoolCopyWith(School value, $Res Function(School) then) =
      _$SchoolCopyWithImpl<$Res, School>;
  @useResult
  $Res call(
      {int id,
      String name,
      SchoolAnalysis analysis,
      Position centroid,
      String? cover,
      @JsonKey(name: 'allow_edit', defaultValue: false) bool allowEdit});

  $SchoolAnalysisCopyWith<$Res> get analysis;
  $PositionCopyWith<$Res> get centroid;
}

/// @nodoc
class _$SchoolCopyWithImpl<$Res, $Val extends School>
    implements $SchoolCopyWith<$Res> {
  _$SchoolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? analysis = null,
    Object? centroid = null,
    Object? cover = freezed,
    Object? allowEdit = null,
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
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as SchoolAnalysis,
      centroid: null == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Position,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      allowEdit: null == allowEdit
          ? _value.allowEdit
          : allowEdit // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $PositionCopyWith<$Res> get centroid {
    return $PositionCopyWith<$Res>(_value.centroid, (value) {
      return _then(_value.copyWith(centroid: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SchoolCopyWith<$Res> implements $SchoolCopyWith<$Res> {
  factory _$$_SchoolCopyWith(_$_School value, $Res Function(_$_School) then) =
      __$$_SchoolCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      SchoolAnalysis analysis,
      Position centroid,
      String? cover,
      @JsonKey(name: 'allow_edit', defaultValue: false) bool allowEdit});

  @override
  $SchoolAnalysisCopyWith<$Res> get analysis;
  @override
  $PositionCopyWith<$Res> get centroid;
}

/// @nodoc
class __$$_SchoolCopyWithImpl<$Res>
    extends _$SchoolCopyWithImpl<$Res, _$_School>
    implements _$$_SchoolCopyWith<$Res> {
  __$$_SchoolCopyWithImpl(_$_School _value, $Res Function(_$_School) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? analysis = null,
    Object? centroid = null,
    Object? cover = freezed,
    Object? allowEdit = null,
  }) {
    return _then(_$_School(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      analysis: null == analysis
          ? _value.analysis
          : analysis // ignore: cast_nullable_to_non_nullable
              as SchoolAnalysis,
      centroid: null == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Position,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      allowEdit: null == allowEdit
          ? _value.allowEdit
          : allowEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_School implements _School {
  const _$_School(
      {required this.id,
      required this.name,
      required this.analysis,
      required this.centroid,
      this.cover,
      @JsonKey(name: 'allow_edit', defaultValue: false)
          required this.allowEdit});

  factory _$_School.fromJson(Map<String, dynamic> json) =>
      _$$_SchoolFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final SchoolAnalysis analysis;
  @override
  final Position centroid;
  @override
  final String? cover;
  @override
  @JsonKey(name: 'allow_edit', defaultValue: false)
  final bool allowEdit;

  @override
  String toString() {
    return 'School(id: $id, name: $name, analysis: $analysis, centroid: $centroid, cover: $cover, allowEdit: $allowEdit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_School &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.analysis, analysis) ||
                other.analysis == analysis) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.allowEdit, allowEdit) ||
                other.allowEdit == allowEdit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, analysis, centroid, cover, allowEdit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchoolCopyWith<_$_School> get copyWith =>
      __$$_SchoolCopyWithImpl<_$_School>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchoolToJson(
      this,
    );
  }
}

abstract class _School implements School {
  const factory _School(
      {required final int id,
      required final String name,
      required final SchoolAnalysis analysis,
      required final Position centroid,
      final String? cover,
      @JsonKey(name: 'allow_edit', defaultValue: false)
          required final bool allowEdit}) = _$_School;

  factory _School.fromJson(Map<String, dynamic> json) = _$_School.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  SchoolAnalysis get analysis;
  @override
  Position get centroid;
  @override
  String? get cover;
  @override
  @JsonKey(name: 'allow_edit', defaultValue: false)
  bool get allowEdit;
  @override
  @JsonKey(ignore: true)
  _$$_SchoolCopyWith<_$_School> get copyWith =>
      throw _privateConstructorUsedError;
}
