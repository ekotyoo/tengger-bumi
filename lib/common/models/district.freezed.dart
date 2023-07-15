// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

District _$DistrictFromJson(Map<String, dynamic> json) {
  return _District.fromJson(json);
}

/// @nodoc
mixin _$District {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'regency_id')
  int get regencyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DistrictCopyWith<District> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictCopyWith<$Res> {
  factory $DistrictCopyWith(District value, $Res Function(District) then) =
      _$DistrictCopyWithImpl<$Res, District>;
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'regency_id') int regencyId});
}

/// @nodoc
class _$DistrictCopyWithImpl<$Res, $Val extends District>
    implements $DistrictCopyWith<$Res> {
  _$DistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? regencyId = null,
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
      regencyId: null == regencyId
          ? _value.regencyId
          : regencyId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DistrictCopyWith<$Res> implements $DistrictCopyWith<$Res> {
  factory _$$_DistrictCopyWith(
          _$_District value, $Res Function(_$_District) then) =
      __$$_DistrictCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'regency_id') int regencyId});
}

/// @nodoc
class __$$_DistrictCopyWithImpl<$Res>
    extends _$DistrictCopyWithImpl<$Res, _$_District>
    implements _$$_DistrictCopyWith<$Res> {
  __$$_DistrictCopyWithImpl(
      _$_District _value, $Res Function(_$_District) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? regencyId = null,
  }) {
    return _then(_$_District(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      regencyId: null == regencyId
          ? _value.regencyId
          : regencyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_District implements _District {
  const _$_District(
      {required this.id,
      required this.name,
      @JsonKey(name: 'regency_id') required this.regencyId});

  factory _$_District.fromJson(Map<String, dynamic> json) =>
      _$$_DistrictFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'regency_id')
  final int regencyId;

  @override
  String toString() {
    return 'District(id: $id, name: $name, regencyId: $regencyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_District &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.regencyId, regencyId) ||
                other.regencyId == regencyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, regencyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      __$$_DistrictCopyWithImpl<_$_District>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DistrictToJson(
      this,
    );
  }
}

abstract class _District implements District {
  const factory _District(
      {required final int id,
      required final String name,
      @JsonKey(name: 'regency_id') required final int regencyId}) = _$_District;

  factory _District.fromJson(Map<String, dynamic> json) = _$_District.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'regency_id')
  int get regencyId;
  @override
  @JsonKey(ignore: true)
  _$$_DistrictCopyWith<_$_District> get copyWith =>
      throw _privateConstructorUsedError;
}
