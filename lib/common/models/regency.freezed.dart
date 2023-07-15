// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'regency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Regency _$RegencyFromJson(Map<String, dynamic> json) {
  return _Regency.fromJson(json);
}

/// @nodoc
mixin _$Regency {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_id')
  int get provinceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegencyCopyWith<Regency> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegencyCopyWith<$Res> {
  factory $RegencyCopyWith(Regency value, $Res Function(Regency) then) =
      _$RegencyCopyWithImpl<$Res, Regency>;
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'province_id') int provinceId});
}

/// @nodoc
class _$RegencyCopyWithImpl<$Res, $Val extends Regency>
    implements $RegencyCopyWith<$Res> {
  _$RegencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? provinceId = null,
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
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegencyCopyWith<$Res> implements $RegencyCopyWith<$Res> {
  factory _$$_RegencyCopyWith(
          _$_Regency value, $Res Function(_$_Regency) then) =
      __$$_RegencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'province_id') int provinceId});
}

/// @nodoc
class __$$_RegencyCopyWithImpl<$Res>
    extends _$RegencyCopyWithImpl<$Res, _$_Regency>
    implements _$$_RegencyCopyWith<$Res> {
  __$$_RegencyCopyWithImpl(_$_Regency _value, $Res Function(_$_Regency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? provinceId = null,
  }) {
    return _then(_$_Regency(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Regency implements _Regency {
  const _$_Regency(
      {required this.id,
      required this.name,
      @JsonKey(name: 'province_id') required this.provinceId});

  factory _$_Regency.fromJson(Map<String, dynamic> json) =>
      _$$_RegencyFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'province_id')
  final int provinceId;

  @override
  String toString() {
    return 'Regency(id: $id, name: $name, provinceId: $provinceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Regency &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, provinceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegencyCopyWith<_$_Regency> get copyWith =>
      __$$_RegencyCopyWithImpl<_$_Regency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegencyToJson(
      this,
    );
  }
}

abstract class _Regency implements Regency {
  const factory _Regency(
          {required final int id,
          required final String name,
          @JsonKey(name: 'province_id') required final int provinceId}) =
      _$_Regency;

  factory _Regency.fromJson(Map<String, dynamic> json) = _$_Regency.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'province_id')
  int get provinceId;
  @override
  @JsonKey(ignore: true)
  _$$_RegencyCopyWith<_$_Regency> get copyWith =>
      throw _privateConstructorUsedError;
}
