// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FloorPlan _$FloorPlanFromJson(Map<String, dynamic> json) {
  return _FloorPlan.fromJson(json);
}

/// @nodoc
mixin _$FloorPlan {
  List<Room> get rooms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorPlanCopyWith<FloorPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorPlanCopyWith<$Res> {
  factory $FloorPlanCopyWith(FloorPlan value, $Res Function(FloorPlan) then) =
      _$FloorPlanCopyWithImpl<$Res, FloorPlan>;
  @useResult
  $Res call({List<Room> rooms});
}

/// @nodoc
class _$FloorPlanCopyWithImpl<$Res, $Val extends FloorPlan>
    implements $FloorPlanCopyWith<$Res> {
  _$FloorPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
  }) {
    return _then(_value.copyWith(
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FloorPlanCopyWith<$Res> implements $FloorPlanCopyWith<$Res> {
  factory _$$_FloorPlanCopyWith(
          _$_FloorPlan value, $Res Function(_$_FloorPlan) then) =
      __$$_FloorPlanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Room> rooms});
}

/// @nodoc
class __$$_FloorPlanCopyWithImpl<$Res>
    extends _$FloorPlanCopyWithImpl<$Res, _$_FloorPlan>
    implements _$$_FloorPlanCopyWith<$Res> {
  __$$_FloorPlanCopyWithImpl(
      _$_FloorPlan _value, $Res Function(_$_FloorPlan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rooms = null,
  }) {
    return _then(_$_FloorPlan(
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<Room>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FloorPlan implements _FloorPlan {
  const _$_FloorPlan({final List<Room> rooms = const []}) : _rooms = rooms;

  factory _$_FloorPlan.fromJson(Map<String, dynamic> json) =>
      _$$_FloorPlanFromJson(json);

  final List<Room> _rooms;
  @override
  @JsonKey()
  List<Room> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'FloorPlan(rooms: $rooms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FloorPlan &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FloorPlanCopyWith<_$_FloorPlan> get copyWith =>
      __$$_FloorPlanCopyWithImpl<_$_FloorPlan>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FloorPlanToJson(
      this,
    );
  }
}

abstract class _FloorPlan implements FloorPlan {
  const factory _FloorPlan({final List<Room> rooms}) = _$_FloorPlan;

  factory _FloorPlan.fromJson(Map<String, dynamic> json) =
      _$_FloorPlan.fromJson;

  @override
  List<Room> get rooms;
  @override
  @JsonKey(ignore: true)
  _$$_FloorPlanCopyWith<_$_FloorPlan> get copyWith =>
      throw _privateConstructorUsedError;
}
