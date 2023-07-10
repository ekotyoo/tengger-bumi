// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'school_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SchoolAnalysis _$SchoolAnalysisFromJson(Map<String, dynamic> json) {
  return _SchoolAnalysis.fromJson(json);
}

/// @nodoc
mixin _$SchoolAnalysis {
  @JsonKey(name: 'prevention_level')
  double? get preventionLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_response_level')
  double? get emergencyResponseLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'recovery_level')
  double? get recoveryLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SchoolAnalysisCopyWith<SchoolAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchoolAnalysisCopyWith<$Res> {
  factory $SchoolAnalysisCopyWith(
          SchoolAnalysis value, $Res Function(SchoolAnalysis) then) =
      _$SchoolAnalysisCopyWithImpl<$Res, SchoolAnalysis>;
  @useResult
  $Res call(
      {@JsonKey(name: 'prevention_level') double? preventionLevel,
      @JsonKey(name: 'emergency_response_level') double? emergencyResponseLevel,
      @JsonKey(name: 'recovery_level') double? recoveryLevel});
}

/// @nodoc
class _$SchoolAnalysisCopyWithImpl<$Res, $Val extends SchoolAnalysis>
    implements $SchoolAnalysisCopyWith<$Res> {
  _$SchoolAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preventionLevel = freezed,
    Object? emergencyResponseLevel = freezed,
    Object? recoveryLevel = freezed,
  }) {
    return _then(_value.copyWith(
      preventionLevel: freezed == preventionLevel
          ? _value.preventionLevel
          : preventionLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      emergencyResponseLevel: freezed == emergencyResponseLevel
          ? _value.emergencyResponseLevel
          : emergencyResponseLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      recoveryLevel: freezed == recoveryLevel
          ? _value.recoveryLevel
          : recoveryLevel // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchoolAnalysisCopyWith<$Res>
    implements $SchoolAnalysisCopyWith<$Res> {
  factory _$$_SchoolAnalysisCopyWith(
          _$_SchoolAnalysis value, $Res Function(_$_SchoolAnalysis) then) =
      __$$_SchoolAnalysisCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'prevention_level') double? preventionLevel,
      @JsonKey(name: 'emergency_response_level') double? emergencyResponseLevel,
      @JsonKey(name: 'recovery_level') double? recoveryLevel});
}

/// @nodoc
class __$$_SchoolAnalysisCopyWithImpl<$Res>
    extends _$SchoolAnalysisCopyWithImpl<$Res, _$_SchoolAnalysis>
    implements _$$_SchoolAnalysisCopyWith<$Res> {
  __$$_SchoolAnalysisCopyWithImpl(
      _$_SchoolAnalysis _value, $Res Function(_$_SchoolAnalysis) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preventionLevel = freezed,
    Object? emergencyResponseLevel = freezed,
    Object? recoveryLevel = freezed,
  }) {
    return _then(_$_SchoolAnalysis(
      preventionLevel: freezed == preventionLevel
          ? _value.preventionLevel
          : preventionLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      emergencyResponseLevel: freezed == emergencyResponseLevel
          ? _value.emergencyResponseLevel
          : emergencyResponseLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      recoveryLevel: freezed == recoveryLevel
          ? _value.recoveryLevel
          : recoveryLevel // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SchoolAnalysis implements _SchoolAnalysis {
  const _$_SchoolAnalysis(
      {@JsonKey(name: 'prevention_level') this.preventionLevel,
      @JsonKey(name: 'emergency_response_level') this.emergencyResponseLevel,
      @JsonKey(name: 'recovery_level') this.recoveryLevel});

  factory _$_SchoolAnalysis.fromJson(Map<String, dynamic> json) =>
      _$$_SchoolAnalysisFromJson(json);

  @override
  @JsonKey(name: 'prevention_level')
  final double? preventionLevel;
  @override
  @JsonKey(name: 'emergency_response_level')
  final double? emergencyResponseLevel;
  @override
  @JsonKey(name: 'recovery_level')
  final double? recoveryLevel;

  @override
  String toString() {
    return 'SchoolAnalysis(preventionLevel: $preventionLevel, emergencyResponseLevel: $emergencyResponseLevel, recoveryLevel: $recoveryLevel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchoolAnalysis &&
            (identical(other.preventionLevel, preventionLevel) ||
                other.preventionLevel == preventionLevel) &&
            (identical(other.emergencyResponseLevel, emergencyResponseLevel) ||
                other.emergencyResponseLevel == emergencyResponseLevel) &&
            (identical(other.recoveryLevel, recoveryLevel) ||
                other.recoveryLevel == recoveryLevel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, preventionLevel, emergencyResponseLevel, recoveryLevel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchoolAnalysisCopyWith<_$_SchoolAnalysis> get copyWith =>
      __$$_SchoolAnalysisCopyWithImpl<_$_SchoolAnalysis>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SchoolAnalysisToJson(
      this,
    );
  }
}

abstract class _SchoolAnalysis implements SchoolAnalysis {
  const factory _SchoolAnalysis(
      {@JsonKey(name: 'prevention_level')
          final double? preventionLevel,
      @JsonKey(name: 'emergency_response_level')
          final double? emergencyResponseLevel,
      @JsonKey(name: 'recovery_level')
          final double? recoveryLevel}) = _$_SchoolAnalysis;

  factory _SchoolAnalysis.fromJson(Map<String, dynamic> json) =
      _$_SchoolAnalysis.fromJson;

  @override
  @JsonKey(name: 'prevention_level')
  double? get preventionLevel;
  @override
  @JsonKey(name: 'emergency_response_level')
  double? get emergencyResponseLevel;
  @override
  @JsonKey(name: 'recovery_level')
  double? get recoveryLevel;
  @override
  @JsonKey(ignore: true)
  _$$_SchoolAnalysisCopyWith<_$_SchoolAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}
