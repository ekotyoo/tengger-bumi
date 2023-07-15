// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'village.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Village _$VillageFromJson(Map<String, dynamic> json) {
  return _Village.fromJson(json);
}

/// @nodoc
mixin _$Village {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int get districtId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VillageCopyWith<Village> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VillageCopyWith<$Res> {
  factory $VillageCopyWith(Village value, $Res Function(Village) then) =
      _$VillageCopyWithImpl<$Res, Village>;
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'district_id') int districtId});
}

/// @nodoc
class _$VillageCopyWithImpl<$Res, $Val extends Village>
    implements $VillageCopyWith<$Res> {
  _$VillageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? districtId = null,
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
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VillageCopyWith<$Res> implements $VillageCopyWith<$Res> {
  factory _$$_VillageCopyWith(
          _$_Village value, $Res Function(_$_Village) then) =
      __$$_VillageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, @JsonKey(name: 'district_id') int districtId});
}

/// @nodoc
class __$$_VillageCopyWithImpl<$Res>
    extends _$VillageCopyWithImpl<$Res, _$_Village>
    implements _$$_VillageCopyWith<$Res> {
  __$$_VillageCopyWithImpl(_$_Village _value, $Res Function(_$_Village) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? districtId = null,
  }) {
    return _then(_$_Village(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Village implements _Village {
  const _$_Village(
      {required this.id,
      required this.name,
      @JsonKey(name: 'district_id') required this.districtId});

  factory _$_Village.fromJson(Map<String, dynamic> json) =>
      _$$_VillageFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'district_id')
  final int districtId;

  @override
  String toString() {
    return 'Village(id: $id, name: $name, districtId: $districtId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Village &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, districtId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VillageCopyWith<_$_Village> get copyWith =>
      __$$_VillageCopyWithImpl<_$_Village>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VillageToJson(
      this,
    );
  }
}

abstract class _Village implements Village {
  const factory _Village(
          {required final int id,
          required final String name,
          @JsonKey(name: 'district_id') required final int districtId}) =
      _$_Village;

  factory _Village.fromJson(Map<String, dynamic> json) = _$_Village.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'district_id')
  int get districtId;
  @override
  @JsonKey(ignore: true)
  _$$_VillageCopyWith<_$_Village> get copyWith =>
      throw _privateConstructorUsedError;
}
